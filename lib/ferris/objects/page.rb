module Ferris
  class Page < Ferris::Core
    attr_reader :url

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(opts = {})
      super()
      @url = opts[:site_url] + partial_url
    end

    def visit
      browser.goto url
      initialize_page if respond_to?(:initialize_page)
      self
    end
  end
end
