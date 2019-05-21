require 'rest-client'
require 'json'

module DigifiApi
  class Base

    def self.headers
      headers = {content_type: :json, accept: :json}
      headers['x-access-token'] = DigifiApi.configuration.x_access_token unless DigifiApi.configuration.x_access_token.nil?
      return headers
    end

    def self.payload(elements)
      body_hash = Hash.new
      body_hash['client_id'] = DigifiApi.configuration.client_id
      body_hash['client_public_key'] = DigifiApi.configuration.client_public_key
      body_hash['client_secret'] = DigifiApi.configuration.secret
      body_hash.merge!(elements)
      body_hash.to_json
    end

    def self.post(resource_uri, elements)
      if DigifiApi.configuration.configured?
        RestClient::Request.execute(:method => :post, url: (DigifiApi.configuration.base_uri + resource_uri), payload: payload(elements), headers: headers, use_ssl: true, verify_ssl: OpenSSL::SSL::VERIFY_NONE) do |response, request, result|
          case response.code
          when 200 # Success
            return response
          when 400 # Bad request
            return { error: "#{response.code}: The request was incorrectly formed" }
          when 401 # Unauthorized
            return { error: "#{response.code}: The authentication credentials were incorrect" }
          when 404 # Strategy not found
            return { error: "#{response.code}: The requested strategy or model cannot be found" }
          when 500 # Internal server error
            return { error: "#{response.code}: There was an error on the server" }
          else
            return { error: "#{response.code}" }
          end
        end
      else
        return { error: "Configuration must be valid before making a request" }
      end
    end

  end
end
