module Ferris
  module Concepts
    module Pages
      def page(name, klass)
        define_method(name) { klass.new(site_url: url) }
      end
    end
  end
end
