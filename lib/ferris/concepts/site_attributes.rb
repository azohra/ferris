module Ferris
  module Concepts
    module SiteAttributes
      def partial_url(&blk)
        define_method(:partial_url) { instance_exec(&blk) }
      end

      def title(&blk)
        define_method(:title) { instance_exec(&blk) }
      end

      def ensure_site_loaded(&blk)
        define_method(:ensure_site_loaded) { instance_exec(&blk) }
        instance_variable_set(ensure_site_loaded, &blk)
      end
    end
  end
end
