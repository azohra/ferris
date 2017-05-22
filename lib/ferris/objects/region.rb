module Ferris
  class Region

    attr_reader :root, :browser, :site

    include Ferris::Concepts::FormFilling

    extend Forwardable
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements

    def_delegators :root, :exists?, :present?

    def initialize(browser, site, &blk)
      @browser = browser
      @site = site
      @root = instance_exec(&blk)
    end

    def load
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end

  end
end
