require "digifi_api/base"

module DigifiApi
  class MLModel < DigifiApi::Base

    @resource_uri = '/ml_models'

    # model_name:string required
    # inputs:object required
    # client_transaction_id opt

    def self.submit(model_name, inputs_hash, options={})

      return { error: "model_name is required" } if model_name.nil?
      return { error: "inputs_hash is required" } if inputs_hash.nil?

      elements = Hash.new
      # Required Elements
      elements['model_name'] = model_name
      elements['inputs_hash'] = inputs_hash

      # Optional Elements
      if options['client_transaction_id']
        elements['client_transaction_id'] = options['client_transaction_id']
      end

      response = self.post(@resource_uri, elements)
    end

  end
end
