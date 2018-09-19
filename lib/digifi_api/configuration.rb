module DigifiApi
  class Configuration

    attr_accessor :client_id, :client_public_key, :secret, :base_uri

    DEFAULT_CLIENT_ID = nil
    DEFAULT_CLIENT_PUBLIC_KEY = nil
    DEFAULT_SECRET = nil
    DEFAULT_BASE_URI = 'https://cloud.digifi.io/api/v2'

    def initialize
      @client_id = DEFAULT_CLIENT_ID
      @client_public_key = DEFAULT_CLIENT_ID
      @secret = DEFAULT_SECRET
      @base_uri = DEFAULT_BASE_URI
    end

    def configured?
      !client_id.nil? &&
      !client_public_key.nil? &&
      !secret.nil? &&
      !base_uri.nil?
    end

    def reset
      @client_id = DEFAULT_CLIENT_ID
      @client_public_key = DEFAULT_CLIENT_ID
      @secret = DEFAULT_SECRET
      @base_uri = DEFAULT_BASE_URI
    end
  end
end
