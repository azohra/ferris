module Ferris
  class Site

    attr_reader :url, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(base_url)
      raise(Ferris::Exception::MissingBrowser) unless Ferris.browser
      @url = base_url
      @browser = Ferris.browser
    end

    def visit
      browser.goto base_url
      initialize_site if respond_to?(:initialize_site)
      self
    end
  end
end
