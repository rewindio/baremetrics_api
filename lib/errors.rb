module Error
  class MissingConfigurationKeys < StandardError
    def initialize(msg = 'One or more required configuration keys are missing or invalid')
      super
    end
  end

  class AlreadyConfigured < StandardError
    def initialize(msg = 'Client has already been configured')
      super
    end
  end
end
