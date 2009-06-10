module OAuthClient
  class Client
  
    # base uri for the API
    class << self
      attr_accessor :site 
    end  
  
    # class method for setting/getting the base uri for API
    def self.site(site = nil)
      @site = site if site
      @site
    end
  
    # constructor
    def initialize(options = {})
      @consumer_key = options[:consumer_key]
      @consumer_secret = options[:consumer_secret]
      @token = options[:token]
      @secret = options[:secret]
      @adapters = {}
    end

    # authorization
    def authorize(token, secret)
      request_token = OAuth::RequestToken.new(
        consumer, token, secret
      )
      @access_token = request_token.get_access_token
      @token = @access_token.token
      @secret = @access_token.secret
      @access_token
    end
  
    # get the request token
    def request_token
      consumer.get_request_token
    end
    
    # make a GET request and return raw response
    def get(url)
      raise OAuthUnauthorized if !access_token
      access_token.get(url)
    end
  
    # make a POST request and return raw response
    def post(url, params = {})
      raise OAuthUnauthorized if !access_token
      access_token.post(url, params)
    end
  
    # json adapter, allowing json.get and json.post methods
    def json
      return @adapters[:json] if @adapters[:json]
      require 'oauth_client/adapters/json'
      @adapters[:json] = OAuthClient::Adapters::Json.new(self)
    end
  
    private
  
      # get the consumer object, with site specified by class variable
      def consumer
        @consumer ||= OAuth::Consumer.new(
          @consumer_key,
          @consumer_secret,
          { :site=> self.class.site }
        )
      end

      # get access token used for API access
      def access_token
        @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
      end

  end

end
