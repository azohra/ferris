module Ferris
  module Exception
    class MissingBrowser < StandardError
      def message
        'You must assign a Watir browser to Ferris.browser'
      end
    end
  end
end
