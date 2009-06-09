require 'rubygems'
require 'oauth'
require 'json'
require 'mime/types'

class OAuthClient
  
  # base site
  class << self; attr_accessor :site end  

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