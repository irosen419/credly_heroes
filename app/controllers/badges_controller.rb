class BadgesController < ApplicationController
  
  def get_badge_templates
    baseUrl = "https://sandbox-api.credly.com/v1/organizations/#{ENV["ORG_ID"]}"
    url = baseUrl + "/badge_templates"
    base64 = Base64::encode64("#{ENV["AUTH_TOKEN"]}:''")
    response = RestClient.get(url,
    { 
      "Authorization" => "Basic " + base64,
      "Accept": "application/json", 
      "Content-Type": "application/json" 
    })
    render json: response
  end
end
