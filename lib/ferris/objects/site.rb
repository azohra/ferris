module Ferris
  class Site

    attr_accessor :url, :browser

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions
    
    def initialize(browser: b, url: u)
      self.url= u
      self.browser= b
    end
    
    def visit
      self.browser.goto url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end
    
  end
end