module Ferris
  class Site < Ferris::Core
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::PageAttributes

    attr_accessor :url

    def initialize(opts = {})
      raise(Ferris::Exception::MissingBaseUrl) unless opts.key?(:base_url)
      self.url = opts[:base_url]
      super()
    end

    def visit
      browser.goto base_url
      initialize_site if respond_to?(:initialize_site)
      self
    end
  end
end
