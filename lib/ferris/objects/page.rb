module Ferris
  class Page
    attr_reader :url, :b, :sa

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize(browser:, url:, site_args:)
      @sa = site_args
      @b = browser
      @url = url + partial_url
    end

    def visit
      b.goto @url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end
  end
end
