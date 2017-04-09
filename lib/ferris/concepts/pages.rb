module Ferris
  module Concepts
    module Pages
      def page(name, klass)
        define_method(name) { klass.new }
      end
    end
  end
end
