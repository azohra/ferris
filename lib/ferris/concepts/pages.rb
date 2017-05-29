module Ferris
  module Concepts
    module Pages
      def page(name, klass)
        define_method(name) { klass.new(browser: b, url: url) }
      end
      alias pg page
    end
  end
end
