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
      ensure_site_loaded if respond_to?(:ensure_site_loaded)
      ensure_page_loaded if respond_to?(:ensure_page_loaded)
      ensure_region_loaded if respond_to?(:ensure_region_loaded)
    end
  end
end
