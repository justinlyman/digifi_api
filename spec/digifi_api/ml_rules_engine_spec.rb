require 'spec_helper'

RSpec.describe DigifiApi::MLRulesEngine do
  describe 'self.submit' do
    it 'returns error if strategy_name is not set' do
      expect(DigifiApi::MLRulesEngine.submit(nil, 'testing', {test_variable: 'test'})).to eq({ error: "strategy_name is required" })
    end

    it 'returns error if strategy_status is not set' do
      expect(DigifiApi::MLRulesEngine.submit('test_strategy', nil, {test_variable: 'test'})).to eq({ error: "strategy_status is required" })
    end
  end
end
