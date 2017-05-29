module Ferris
  module Session
    class Remote 

      include Ferris::Session
      
      CAPS_MAP   = { browser: :browser_name,
                     version: :version,
                     os:      :platform,
                     name:    :name }.freeze

      def initialize(**keyword_args)
        hub = keyword_args.fetch(:hub, "http://localhost:4444/wd/hub")
        @caps = Selenium::WebDriver::Remote::Capabilities.new
        keyword_args.each { |k, v| add_capability(k, v) if CAPS_MAP.include?(k) }
        @browser = Watir::Browser.new(:remote, url: hub, desired_capabilities: @caps)
      end

      def add_capability(k, v)
        @caps.send("#{CAPS_MAP[k]}=", v)
      end

    end
  end
end   
