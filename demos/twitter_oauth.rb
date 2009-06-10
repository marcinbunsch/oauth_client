# This is a Twitter API client demo built on top of OAuthClient
require 'oauth_client'
class TwitterOAuth < OAuthClient::Client
  site 'http://twitter.com'
  
  def show(username)
    json.get("/users/show/#{username}.json")
  end

  def friends(username)
    json.get("/friends/ids/#{username}.json")
  end
  
  def user(page=1)
    json.get("/statuses/user_timeline.json?page=#{page}")
  end
  
  def update(message)
    json.post('/statuses/update.json', :status => message)
  end
 
end

