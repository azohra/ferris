module Ferris
  module Concepts
    module Elements
      def elements(name, &block)
        define_method(name) { instance_variable_set("@_#{name}", instance_exec(&block)) }
        define_method("#{name}!") { instance_variable_get("@_#{name}") || send(name) }
      end

      def element(name, &block)
        define_method(name) do
          instance_variable_set("@_#{name}", instance_exec(&block).tap { |el| el.keyword = name })
        end
        define_method("#{name}!") { instance_variable_get("@_#{name}") || send(name) }
      end
    end
  end
end
