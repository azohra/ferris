module Ferris
  module Concepts
    module Regions
      def region(name, klass, &blk)
        define_method(name) do
          root = instance_exec(&blk)
          if root.respond_to?(:to_a)
            root.map { |rt| klass.new(browser: b, root: rt, site_args: sa) }
          else
            klass.new(browser: b, root: root, site_args: sa)
          end
        end
      end
      alias rgn region
    end
  end
end
