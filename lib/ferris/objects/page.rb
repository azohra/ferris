module Ferris
  class Page
    attr_reader :url, :session, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(**keyword_args)
      @session = keyword_args[:session]
      @browser = @session.browser
      @url = keyword_args[:url] + partial_url
    end

    def visit
      browser.goto url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end
  end
end
