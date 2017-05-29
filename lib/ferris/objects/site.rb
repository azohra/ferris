module Ferris
  class Site
    attr_reader :url, :b, :width, :height

    include Ferris::Concepts::FormFilling

    extend Ferris::Concepts::Elements
    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(type, **keyword_args)
      @session = case type
                 when :local  then Ferris::Session::Local.new(keyword_args)
                 when :remote then Ferris::Session::Remote.new(keyword_args)
                 end
      @b = @session.browser
      @url = keyword_args[:url]
    end

    def visit
      b.goto url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end

    def close
      b.quit
    end

    def maximize
      b.driver.manage.window.maximize
      @width  = b.execute_script('return screen.width;')
      @height = b.execute_script('return screen.height;')
    end

    def resize_to(width: @width, height: @height)
      b.driver.manage.window.resize_to(width, height)
    end

    def clear_cookies
      b.cookies.clear
    end
  end
end
