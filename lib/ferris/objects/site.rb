module Ferris
  class Site < Ferris::Core

    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::PageAttributes

    def initialize
      super
      @@root_url = base_url
    end

    def self.root_url
      @@root_url
    end

    def visit
      browser.goto base_url
      self
    end

  end
end
