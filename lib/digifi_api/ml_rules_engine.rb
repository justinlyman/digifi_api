require "digifi_api/base"

module DigifiApi
  class MLRulesEngine < DigifiApi::Base

    @resource_uri = '/ml_rules_engine'

    # strategy_name:string required
    # strategy_status:string required
    # variables:object required
    # client_transaction_id opt
    # return_input_variables:bool opt
    # return_processing_detail:bool opt
    # return_data_sources:bool opt

    def self.submit(strategy_name, strategy_status, variables_hash, options={})

      return { error: "strategy_name is required" } if strategy_name.nil?
      return { error: "strategy_status is required" } if strategy_status.nil?

      elements = Hash.new
      # Required Elements
      elements['strategy_name'] = strategy_name
      elements['strategy_status'] = strategy_status
      elements['variables'] = variables_hash

      # Optional Elements
      if options['client_transaction_id']
        elements['client_transaction_id'] = options['client_transaction_id']
      end

      if options['return_input_variables']
        if options['return_input_variables'] == true || options['return_input_variables'] == 'true'
          elements['return_input_variables'] = true
        end
      end

      if options['return_processing_detail']
        if options['return_processing_detail'] == true || options['return_processing_detail'] == 'true'
          elements['return_processing_detail'] = true
        end
      end

      if options['return_data_sources']
        if options['return_data_sources'] == true || options['return_data_sources'] == 'true'
          elements['return_data_sources'] = true
        end
      end

      response = self.post(@resource_uri, elements)
    end

  end
end
