module Ferris
  module Concepts

    module Regions
      def regions(name, klass, &blk)
        define_method(name) { instance_exec(&blk).map { |root| klass.new(root) } }
      end

      def region(name, klass, &blk)
        define_method(name) { klass.new(&blk) }
      end
    end

    module Pages
      def page(name, klass)
        define_method(name) { klass.new }
      end
    end

    module PageAttributes
      def partial_url(&blk)
        define_method(:partial_url) { instance_exec(&blk) }
      end

      def verifiable_url(&blk)
        define_method(:verifiable_url) { instance_exec(&blk) }
      end

      def page_title(&blk)
        define_method(:page_title) { instance_exec(&blk) }
      end
    end

    module Elements
      def elements(name, &block)
        define_method(name) { |*args| instance_exec(*args, &block) }
      end

      def element(name, &block)
        define_method(name) { |*args| instance_exec(*args, &block).tap { |el| el.keyword = name } }
      end
    end
    
  end
end
