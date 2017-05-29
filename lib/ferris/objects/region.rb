module Ferris
  class Region
    attr_reader :root, :browser

    include Ferris::Concepts::FormFilling

    extend Forwardable
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements

    def_delegators :root, :exists?, :present?

    def initialize(browser:, root: false, &blk)
      @browser = browser
      @root = root ? root : instance_exec(&blk)
    end
  end
end
