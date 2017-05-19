module Ferris
  class Site

    attr_reader :url, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(url)
      raise(Ferris::Exception::MissingBrowser) unless Ferris.browser
      @url = url
      @browser = Ferris.browser
    end

    def visit
      browser.goto base_url
      ensure_site_loaded if respond_to?(:ensure_site_loaded)
      self
    end
  end
end
