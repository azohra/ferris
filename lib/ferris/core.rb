module Ferris
  class Core

    attr_reader :browser

    def initialize
      @browser = Ferris.browser
    end

  end
end

