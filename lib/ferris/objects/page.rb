module Ferris
  class Page

    attr_reader :url, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(browser, site_url)
      @url = site_url + partial_url
      @browser = browser
    end

    def visit
      browser.goto url
      ensure_site_loaded if respond_to?(:ensure_site_loaded)
      ensure_page_loaded if respond_to?(:ensure_page_loaded)
      self
    end

  end
end
