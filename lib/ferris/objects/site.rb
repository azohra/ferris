module Ferris
  class Site
    attr_reader :url, :session, :browser

    include Ferris::Concepts::FormFilling

    extend Forwardable
    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def_delegators :session, :close, :size=, :maximize, :clear_cookies

    def initialize(type, **keyword_args)
      @session = case type
                 when :local  then Ferris::Session::Local.new(keyword_args)
                 when :remote then Ferris::Session::Remote.new(keyword_args)
                 end
      @browser = @session.browser           
      @url = keyword_args[:url]
    end
    
    def visit
      browser.goto url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end

  end
end
