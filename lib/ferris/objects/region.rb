module Ferris
  class Region

    attr_reader :root, :browser

    include Ferris::Concepts::FormFilling

    extend Forwardable
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements

    def_delegators :root, :exists?, :present?

    def initialize(browser, &blk)
      @browser = browser
      @root = instance_exec(&blk)
    end

    def load
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end

  end
end
