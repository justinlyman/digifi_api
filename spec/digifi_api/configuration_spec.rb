require 'spec_helper'

RSpec.describe DigifiApi::Configuration do

  before(:each) do
    DigifiApi.configuration.reset
  end

  describe '.client_id' do
    it 'returns the default value' do
      expect(DigifiApi.configuration.client_id).to eq(DigifiApi::Configuration::DEFAULT_CLIENT_ID)
    end
  end

  describe '.client_public_key' do
    it 'returns the default value' do
      expect(DigifiApi.configuration.client_public_key).to eq(DigifiApi::Configuration::DEFAULT_CLIENT_PUBLIC_KEY)
    end
  end

  describe '.secret' do
    it 'returns the default value' do
      expect(DigifiApi.configuration.secret).to eq(DigifiApi::Configuration::DEFAULT_SECRET)
    end
  end

  describe '.base_uri' do
    it 'returns the default value' do
      expect(DigifiApi.configuration.base_uri).to eq(DigifiApi::Configuration::DEFAULT_BASE_URI)
    end
  end

  describe 'configured?' do
    it 'returns false if .client_id nil' do
      DigifiApi.configure do |config|
        config.client_id = nil
        config.client_public_key = 'testpubkey'
        config.secret = 'testsecret'
      end
      expect(DigifiApi.configuration.configured?).to equal(false)
    end

    it 'returns false if .client_public_key nil' do
      DigifiApi.configure do |config|
        config.client_id = 'testclientid'
        config.client_public_key = nil
        config.secret = 'testsecret'
      end
      expect(DigifiApi.configuration.configured?).to equal(false)
    end

    it 'returns false if .secret nil' do
      DigifiApi.configure do |config|
        config.client_id = 'testclientid'
        config.client_public_key = 'testpubkey'
        config.secret = nil
      end
      expect(DigifiApi.configuration.configured?).to equal(false)
    end

    it 'returns false if .base_uri nil' do
      DigifiApi.configure do |config|
        config.client_id = 'testclientid'
        config.client_public_key = 'testpubkey'
        config.secret = 'testsecret'
        config.base_uri = nil
      end
      expect(DigifiApi.configuration.configured?).to equal(false)
    end

    it 'returns true if all required configurations are set' do
      DigifiApi.configure do |config|
        config.client_id = 'testclientid'
        config.client_public_key = 'testpubkey'
        config.secret = 'testsecret'
      end
      expect(DigifiApi.configuration.configured?).to equal(true)
    end
  end

  describe 'reset' do
    it 'sets all config values to defaults' do
      DigifiApi.configure do |config|
        config.client_id = 'testclientid'
        config.client_public_key = 'testpubkey'
        config.secret = 'testsecret'
        config.base_uri = "https://test.com"
      end
      DigifiApi.configuration.reset
      expect(DigifiApi.configuration.client_id).to eq(DigifiApi::Configuration::DEFAULT_CLIENT_ID)
      expect(DigifiApi.configuration.client_public_key).to eq(DigifiApi::Configuration::DEFAULT_CLIENT_PUBLIC_KEY)
      expect(DigifiApi.configuration.secret).to eq(DigifiApi::Configuration::DEFAULT_SECRET)
      expect(DigifiApi.configuration.base_uri).to eq(DigifiApi::Configuration::DEFAULT_BASE_URI)
    end
  end

end
