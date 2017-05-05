module Ferris
  module Exception
    class MissingBaseUrl < StandardError
      def message
        'You must provide a base url when instantiating a Ferris::Site'
      end
    end
  end
end
