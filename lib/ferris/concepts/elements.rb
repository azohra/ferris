module Ferris
  module Concepts
    module Elements
      def elements(name, &block)
        define_method(name) { instance_exec(&block) }
      end

      def element(name, &block)
        define_method(name) { instance_exec(&block).tap { |el| el.keyword = name } }
      end
    end
  end
end
