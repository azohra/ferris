module Ferris
  module Concepts
    module Regions
      def regions(name, klass, &blk)
        define_method(name) do
          instance_variable_set("@_#{name}", instance_exec(&blk).map { |block| klass.new(browser: self.browser, root: block) })
        end
        define_method("#{name}!") { instance_variable_get("@_#{name}") || send(name) }
      end

      def region(name, klass, &blk)
        define_method(name) { instance_variable_set("@_#{name}", klass.new(browser: self.browser, &blk)) }
        define_method("#{name}!") { instance_variable_get("@_#{name}") || send(name) }
      end
    end
  end
end
