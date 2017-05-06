module Ferris
  module Concepts
    module Pages
      def page(name, klass)
        define_method(name) { klass.new(browser, url) }
      end
    end
  end
end
