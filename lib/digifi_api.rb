require "digifi_api/version"
require "digifi_api/configuration"
require "digifi_api/base"
require "digifi_api/ml_model"
require 'digifi_api/ml_rules_engine'

module DigifiApi
  class << self

    attr_writer :configuration

    def configure
      yield configuration
    end

    def configuration
      @configuration ||= Configuration.new
    end

  end
end
