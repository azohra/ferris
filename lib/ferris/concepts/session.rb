module Ferris
  module Session

      attr_reader :browser, :width, :height

      def close
        browser.quit
      end

      def maximize
        browser.driver.manage.window.maximize
        @width  = browser.execute_script('return screen.width;')
        @height = browser.execute_script('return screen.height;')
      end

      def size=(width: @width, height: @height)
        browser.driver.manage.window.resize_to(width, height)
      end

      def clear_cookies
        browser.cookies.clear
      end

  end
end  