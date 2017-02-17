module Ferris
  module Config
    class << self
      attr_accessor :browser, :headless_driver, :custom
    end

    def browser
      Config.browser
    end

    def custom
      Config.custom
    end

    def headless_driver
      Config.headless_driver
    end
  end

  module Region
    def base_url(url = nil)
      @base_url ||= url
    end

    def region(name, class_name, &blk)
      define_method(name) do
        class_name.base_url = self.class.base_url
        class_name.new.tap do |region|
          if block_given?
            root = instance_exec(&blk)
            return root.map { |rt| class_name.new.tap { |rgn| rgn.root = rt } } if root.respond_to?(:to_a)
            region.root = root
          end
        end
      end
    end
    alias_method :page, :region
  end

  class Core
    extend Region
    include Watir::Waitable

    attr_reader   :browser, :base_url
    attr_accessor :root

    def initialize(browser = Config.browser)
      @browser = browser
      @base_url = self.class.base_url || ''
      self.class.element_list.each do |e_name|
        if send(e_name).is_a?(Watir::HTMLElementCollection)
          send(e_name).each_with_index { |element, index| element.keyword = "#{e_name}_#{index}" }
        else
          send(e_name).keyword = e_name
        end
      end
    end

    def present?
      root ? root.present? : raise(Ferris::RootMissingException)
    end

    def visit(*args)
      browser.goto page_url(*args)
      self
    end

    def verifiable?
      self.class.require_url || self.class.require_page_title || self.class.required_element_list.any?
    end

    def loaded?
      verifiable? ? [check_url, check_title, check_required_elements].all? : raise(Ferris::RequirementsException)
    end

    def check_url
      !self.class.require_url || browser.wait_until { |_b| uri_parse(page_url) == uri_parse(browser.url) }
    end

    def uri_parse(url)
      url[%r{^#{URI.parse(url).scheme}://(.*?)/?$}, 1]
    end

    def check_title
      !self.class.require_page_title || browser.wait_until { |_b| browser.title == page_title }
    end

    def check_required_elements
      !self.class.required_element_list.any? || browser.wait_until { |_b| self.class.required_element_list.all? { |e| send(e).present? } }
    end

    class << self
      attr_writer   :required_element_list, :element_list
      attr_reader   :require_url, :require_page_title
      attr_accessor :base_url

      def page_url(required: false)
        @require_url = required
        define_method('page_url') { |*args| base_url + yield(*args) }
      end
      alias_method :partial_url, :page_url

      def page_title(required: false)
        @require_page_title = required
        define_method('page_title') { |*args| yield(*args) }
      end

      def element_list
        @element_list ||= []
      end

      def required_element_list
        @required_element_list ||= []
      end

      def inherited(subclass)
        subclass.required_element_list = required_element_list.dup
        subclass.element_list = element_list.dup
      end

      def element(name, required: false, &block)
        define_method(name) { |*args| instance_exec(*args, &block) }
        element_list << name.to_sym
        required_element_list << name.to_sym if required
      end
    end
  end

  module SiteObject
    def self.configure(&blk)
      raise 'Must provide block with defined regions' unless block_given?
      last_defined_class = defined_classes.last
      last_defined_class.include Config
      last_defined_class.extend Region
      last_defined_class.instance_exec(&blk)
    end

    def self.defined_classes
      constants.select { |k| const_get(k).is_a? Class }.map { |class_name| Object.const_get("#{self}::#{class_name}") }
    end

    def self.included(_kls)
      @@defined_classes = defined_classes
    end

    def method_missing(name, *arg, &blk)
      @@defined_classes.each { |class_name| return class_name.new.send(name, *arg, &blk) if class_name.new.respond_to?(name) }
      super
    end

    def respond_to_missing?(method_name, _include_private = false)
      @@defined_classes.each { |class_name| return true if class_name.new.respond_to?(method_name) }
      super
    end
  end
end
