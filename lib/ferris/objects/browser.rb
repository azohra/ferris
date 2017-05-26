module Ferris
  module Browser
    class << self
      attr_reader :browser

      CAPS_MAP   = { browser: :browser_name,
                     version: :version,
                     os:      :platform,
                     name:    :name }.freeze

      SWITCH_MAP = { headless:          '--headless',
                     cpu_only:          '--disable-gpu',
                     profile:           'user-data-dir=****',
                     size:              '--window-size=****',
                     user_agent:        '--user-agent=****',
                     ignore_ssl_errors: '--ignore-certificate-errors' }.freeze

      PREF_MAP   = { geolocation: :managed_default_content_settings,
                     password_manager: :password_manager_enabled }.freeze

      def start(**keyword_args)
        b = keyword_args.fetch(:browser, :chrome)
        @switches = []
        @prefs = { profile: { managed_default_content_settings: {} } }
        keyword_args.each do |k, v|
          add_switch(k, v) if SWITCH_MAP.include?(k) && v  # dont write false switches
          add_pref(k, v)   if PREF_MAP.include?(k)         # write false prefs
        end
        @browser = Watir::Browser.new(b, switches: @switches, prefs: @prefs)
        maximize
      end

      def remote(**keyword_args)
        raise 'You must provide a hub url' unless keyword_args.include?(:hub)
        @caps = Selenium::WebDriver::Remote::Capabilities.new
        keyword_args.each { |k, v| add_capability(k, v) if CAPS_MAP.include?(k) }
        @browser = Watir::Browser.new(:remote, url: keyword_args[:hub], desired_capabilities: @caps)
      end

      def stop
        browser.close
      end

      def maximize
        browser.driver.manage.window.maximize
        @width  = browser.execute_script('return screen.width;')
        @height = browser.execute_script('return screen.height;')
      end

      def size=(width: @width, height: @height)
        browser.driver.manage.window.resize_to(width, height)
      end

      def clear_cookies
        browser.cookies.clear
      end

      private

      def add_capability(k, v)
        @caps.send("#{CAPS_MAP[k]}=", v)
      end

      def add_pref(k, v)
        case k
        when :geolocation
          @prefs[:profile][:managed_default_content_settings][:geolocation] = v.to_i
        else
          @prefs[:profile][PREF_MAP[k]] = v
        end
      end

      def add_switch(k, v)
        @switches.push SWITCH_MAP[k].gsub('****', v.to_s)
      end
    end
  end
end
