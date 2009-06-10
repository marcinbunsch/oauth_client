# This is a Tripit API client demo built on top of OAuthClient
require 'oauth_client'
class TripitOAuth < OAuthClient::Client
  site 'https://api.tripit.com'

  def info
    json.get('/v1/get/profile?format=json')
  end
 
  def trips
    json.get('/v1/list/trip/traveler/true?format=json')
  end

end

