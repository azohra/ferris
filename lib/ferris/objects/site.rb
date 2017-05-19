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
<<<<<<< HEAD
      browser.goto base_url
      ensure_site_loaded if respond_to?(:ensure_site_loaded)
=======
      browser.goto self.url
      initialize_site if respond_to?(:initialize_site)
>>>>>>> f6bec7175865d8e9cde023b013a7587b1b8a1804
      self
    end
  end
end
