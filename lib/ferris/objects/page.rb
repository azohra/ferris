module Ferris
  class Page < Ferris::Core
    attr_reader :url

    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::PageAttributes

    def initialize
      super
      @url = Ferris::Site.root_url + partial_url
    end

    def visit
      browser.goto url
      self
    end
  end
end
