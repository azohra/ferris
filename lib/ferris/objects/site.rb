module Ferris
  module Site
    attr_reader :url, :watir

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(browser: Ferris::Browser.browser, url:)
      @url = url
      @watir = browser
    end

    def site
      self
    end

    def visit
      watir.goto url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end
  end
end
