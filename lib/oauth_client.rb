require 'rubygems'
require 'oauth'
require 'json'

class OAuthClient
  
  # base site
  class << self
    attr_accessor :site 
  end  

  def self.site(site = nil)
    @site = site if site
    @site
  end
  
  def initialize(options = {})
    @consumer_key = options[:consumer_key]
    @consumer_secret = options[:consumer_secret]
    @token = options[:token]
    @secret = options[:secret]
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
  
  def authentication_request_token
    consumer.options[:authorize_path] = '/oauth/authenticate'
    request_token
  end
  
  def request_token
    consumer.get_request_token
  end
  
  # request helpers
  def get(url)
    raise OAuthUnauthorized if !access_token
    access_token.get(url)
  end
  
  def post(url, params = {})
    raise OAuthUnauthorized if !access_token
    access_token.post(url, params)
  end
  
  def get_json(url)
    oauth_response = get(url)
    JSON.parse(oauth_response.body)
  end
  
  def post_json(url, params = {})
    oauth_response = get(url, params)
    JSON.parse(oauth_response.body)
  end
  
  private
    def consumer
      @consumer ||= OAuth::Consumer.new(
        @consumer_key,
        @consumer_secret,
        { :site=> self.class.site }
      )
    end

    def access_token
      @access_token ||= OAuth::AccessToken.new(consumer, @token, @secret)
    end
end

class OAuthUnauthorized < Exception
end