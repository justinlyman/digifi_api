require 'spec_helper'

RSpec.describe DigifiApi do
  describe 'Version' do
    it 'should have a version' do
      expect(DigifiApi::VERSION).to_not be_nil
    end
  end
end
