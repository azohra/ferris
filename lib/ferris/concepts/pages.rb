module Ferris
  module Concepts
    module Pages
      def page(name, klass)
        define_method(name) { instance_variable_set("@_#{name}", klass.new(site_url: self.url, browser: self.browser)) }
        define_method("#{name}!") { instance_variable_get("@_#{name}") || send(name) }
      end
    end
  end
end
