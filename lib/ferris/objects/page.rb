module Ferris
  class Page
    attr_reader :url, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(site_url:, browser:)
      @browser = browser
      @url = site_url + partial_url
    end

    def visit
      browser.goto url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end
  end
end
