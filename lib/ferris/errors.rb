module Ferris
  class RequirementsException < StandardError
    def initialize(msg = 'You cannot call .loaded? without setting a required URL / PageTitle / Element')
      super
    end
  end

  class RootMissingException < StandardError
    def initialize(msg = 'You cannot call .present? on un-rooted pages/regions')
      super
    end
  end
end
