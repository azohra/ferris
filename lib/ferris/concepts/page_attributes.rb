module Ferris
  module Concepts
    module PageAttributes
      def partial_url(&blk)
        define_method(:partial_url) { instance_exec(&blk) }
      end

      def title(&blk)
        define_method(:title) { instance_exec(&blk) }
      end

      def ensure_page_loaded(&blk)
        define_method(:ensure_page_loaded) { instance_exec(&blk) }
      end
    end
  end
end
