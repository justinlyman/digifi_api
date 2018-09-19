require 'spec_helper'

RSpec.describe DigifiApi::Base do

  describe 'self.headers' do
    it 'returns headers hash' do
      expect(DigifiApi::Base.headers).to eq({content_type: :json, accept: :json})
    end
  end

  describe 'self.payload' do
  end

  describe 'self.post' do
    before(:each) do
      DigifiApi.configuration.reset
    end
    it 'returns error without a configuration' do
      expect(DigifiApi::Base.post('test_resource', {test: 'test'})).to eq({ error: "Configuration must be valid before making a request" })
    end

    describe 'response codes' do
      it 'returns response with code 200' do
        # Set Configuration
        DigifiApi.configure do |config|
          config.client_id = 'testclientid'
          config.client_public_key = 'testpubkey'
          config.secret = 'testsecret'
        end
        # Build Mock Request
        response_body = {
            "client_id": "testclientid",
            "status_code": 200,
            "status_message": "Success",
            "request_date": "2018-01-01T00:00:00.000Z",
            "response_date": "2018-01-01T00:00:00.000Z",
            "transaction_id:": 100000,
            "client_transaction_id": "",
            "strategy_name": "test_strategy",
            "strategy_version": 1,
            "strategy_status": "testing",
            "results": {
              "passed": true,
              "decline_reasons": [],
              "output_variables": {
                "test": "test"
              }
            }
          }
        stub_request(:post, "https://cloud.digifi.io/api/v2/ml_rules_engine").to_return(status: 200, body: response_body.to_json, headers: {})

        elements = {strategy_name: 'test_strategy', strategy_status: 'testing', variables: {test: 'test'}}
        response = DigifiApi::Base.post('/ml_rules_engine', elements)
        expect(response.code).to eq(200)
        expect(response.class).to be(RestClient::Response)
      end

      it 'returns error with response code 400' do
        # Set Configuration
        DigifiApi.configure do |config|
          config.client_id = 'testclientid'
          config.client_public_key = 'testpubkey'
          config.secret = 'testsecret'
        end
        # Build Mock Request
        stub_request(:post, "https://cloud.digifi.io/api/v2/ml_rules_engine").to_return(status: 400, body: 'Code Test', headers: {})

        elements = {strategy_name: 'test_strategy', strategy_status: 'testing', variables: {test: 'test'}}
        response = DigifiApi::Base.post('/ml_rules_engine', elements)
        expect(response.class).to be(Hash)
        expect(response[:error]).to eq("400: The request was incorrectly formed")
      end

      it 'returns error with response code 401' do
        # Set Configuration
        DigifiApi.configure do |config|
          config.client_id = 'bad_testclientid'
          config.client_public_key = 'testpubkey'
          config.secret = 'testsecret'
        end
        # Build Mock Request
        stub_request(:post, "https://cloud.digifi.io/api/v2/ml_rules_engine").to_return(status: 401, body: 'Code Test', headers: {})

        elements = {strategy_name: 'test_strategy', strategy_status: 'testing', variables: {test: 'test'}}
        response = DigifiApi::Base.post('/ml_rules_engine', elements)
        expect(response.class).to be(Hash)
        expect(response[:error]).to eq("401: The authentication credentials were incorrect")
      end

      it 'returns error with response code 404' do
        # Set Configuration
        DigifiApi.configure do |config|
          config.client_id = 'testclientid'
          config.client_public_key = 'testpubkey'
          config.secret = 'testsecret'
        end
        # Build Mock Request
        stub_request(:post, "https://cloud.digifi.io/api/v2/ml_rules_engine").to_return(status: 404, body: 'Code Test', headers: {})

        elements = {strategy_name: 'test_strategy', strategy_status: 'testing', variables: {test: 'test'}}
        response = DigifiApi::Base.post('/ml_rules_engine', elements)
        expect(response.class).to be(Hash)
        expect(response[:error]).to eq("404: The requested strategy or model cannot be found")
      end

      it 'returns error with response code 500' do
        # Set Configuration
        DigifiApi.configure do |config|
          config.client_id = 'testclientid'
          config.client_public_key = 'testpubkey'
          config.secret = 'testsecret'
        end
        # Build Mock Request
        stub_request(:post, "https://cloud.digifi.io/api/v2/ml_rules_engine").to_return(status: 500, body: 'Code Test', headers: {})

        elements = {strategy_name: 'test_strategy', strategy_status: 'testing', variables: {test: 'test'}}
        response = DigifiApi::Base.post('/ml_rules_engine', elements)
        expect(response.class).to be(Hash)
        expect(response[:error]).to eq("500: There was an error on the server")
      end
    end
  end

end
