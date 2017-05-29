module Ferris
  class Region
    attr_reader :r, :b, :sa

    include Ferris::Concepts::FormFilling

    extend Forwardable
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements

    def_delegators :r, :exists?, :present?

    def initialize(browser:, root:, site_args:)
      @sa = site_args
      @b = browser
      @r = root
      initializer if respond_to?(:initializer)
    end
  end
end
