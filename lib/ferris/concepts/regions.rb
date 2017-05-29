module Ferris
  module Concepts
    module Regions
      def region(name, klass, &blk)
        define_method(name) do
          root = instance_exec(&blk)
          if root.respond_to?(:to_a)
            root.map { |rt| klass.new(browser: b, root: rt) }
          else
            klass.new(browser: b, root: root)
          end
        end
      end
      alias rgn region
    end
  end
end
