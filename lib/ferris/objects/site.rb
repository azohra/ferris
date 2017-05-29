
module Ferris
  class Site
    attr_reader :url, :b, :site_args, :width, :height

    extend Ferris::Concepts::Pages
    extend Ferris::Concepts::Regions

    def initialize(type, **args)
      @b = Ferris::Browser.send(type, args)
      @url = args[:url]
      @site_args = args
      visit
    end

    def visit
      @b.goto @url
      ensure_loaded if respond_to?(:ensure_loaded)
      self
    end

    def close
      @b.quit
    end

    def maximize
      @b.driver.manage.window.maximize
      @width  = @b.execute_script('return screen.width;')
      @height = @b.execute_script('return screen.height;')
    end

    def resize_to(width: @width, height: @height)
      @b.driver.manage.window.resize_to(width, height)
    end

    def clear_cookies
      @b.cookies.clear
    end
  end
end
