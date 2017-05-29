module Ferris
  module Session
    class Local
      attr_reader :browser, :switches, :prefs

      SWITCH_MAP = { headless:          '--headless',
                     cpu_only:          '--disable-gpu',
                     profile:           'user-data-dir=****',
                     size:              '--window-size=****',
                     user_agent:        '--user-agent=****',
                     ignore_ssl_errors: '--ignore-certificate-errors' }.freeze

      PREF_MAP   = { geolocation: :managed_default_content_settings,
                     password_manager: :password_manager_enabled }.freeze

      def initialize(**keyword_args)
        vendor = keyword_args.fetch(:browser, :chrome)
        @switches = []
        @prefs = { profile: { managed_default_content_settings: {} } }
        keyword_args.each do |k, v|
          add_switch(k, v) if SWITCH_MAP.include?(k) && v  # dont write false switches
          add_pref(k, v)   if PREF_MAP.include?(k)         # write false prefs
        end
        @browser = Watir::Browser.new(vendor, switches: @switches, prefs: @prefs)
      end

      def add_switch(k, v)
        @switches.push SWITCH_MAP[k].gsub('****', v.to_s)
      end

      def add_pref(k, v)
        case k
        when :geolocation
          @prefs[:profile][:managed_default_content_settings][:geolocation] = v.to_i
        else
          @prefs[:profile][PREF_MAP[k]] = v
        end
      end
    end
  end
end
