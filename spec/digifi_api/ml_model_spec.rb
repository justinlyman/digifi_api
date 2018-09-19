require 'spec_helper'

RSpec.describe DigifiApi::MLModel do
  describe 'self.submit' do
    it 'returns error if model_name is not set' do
      expect(DigifiApi::MLModel.submit(nil, {})).to eq({ error: "model_name is required" })
    end

    it 'returns error if inputs_hash is not set' do
      expect(DigifiApi::MLModel.submit('test', nil)).to eq({ error: "inputs_hash is required" })
    end
  end
end
