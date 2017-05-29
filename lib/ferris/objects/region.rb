module Ferris
  class Region
    attr_reader :root, :session, :browser

    include Ferris::Concepts::FormFilling

    extend Forwardable
    extend Ferris::Concepts::Regions
    extend Ferris::Concepts::Elements

    def_delegators :root, :exists?, :present?

    def initialize(**keyword_args, &blk)
      @session = keyword_args[:session]
      @browser = @session.browser
      @root = keyword_args[:root] ? keyword_args[:root] : instance_exec(&blk)
    end

  end
end
