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
      initialize_page if respond_to?(:initialize_page)
      self
    end


  end
end
