require 'json'
module OAuthClient
  module Adapters
    # Json Adapter for OAuthClient
    class Json
      attr_accessor :client
  
      # on creation, the adapter must be supplied with the client
      def initialize(client)
        self.client = client
      end
  
      # make a GET request and parse JSON response
      def get(url)
        oauth_response = self.client.get(url)
        JSON.parse(oauth_response.body)
      end
  
      # make a GET request and parse JSON response
      def post(url, params = {})
        oauth_response = self.client.post(url, params)
        JSON.parse(oauth_response.body)
      end
    end
  end
end
