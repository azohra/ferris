module Ferris
  class Region
    attr_reader :r, :b

    include Ferris::Concepts::FormFilling

    extend Forwardable
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements

    def_delegators :r, :exists?, :present?

    def initialize(browser:, root:)
      @b = browser
      @r = root
    end
  end
end
