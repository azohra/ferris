module Ferris
  class Core
    attr_reader :browser

    def initialize
      @browser = Ferris.browser
    end

    def do(data)
      data.each { |k, v| send(k).do(v) }
      browser.send_keys :tab
    end

    def do!(data)
      data.each { |k, v| send(k).do!(v) }
      browser.send_keys :tab
    end
  end
end
