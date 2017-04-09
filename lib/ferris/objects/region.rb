module Ferris
  class Region < Ferris::Core
    attr_reader :root

    extend Forwardable
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements

    def_delegators :root, :exists?, :present?

    def initialize(&blk)
      super
      @root = instance_exec(&blk)
    end
  end
end
