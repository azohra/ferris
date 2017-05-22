module Ferris
  class Page

    attr_reader :url, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(browser, site)
      @site = site
      @url = @site.url + partial_url
      @browser = browser
    end

    def visit
      browser.goto url
      @site.ensure_loaded if site.respond_to?(:ensure_site_loaded)
      ensure_loaded if respond_to?(:ensure_page_loaded)
      self
    end

  end
end
