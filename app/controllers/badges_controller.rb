class BadgesController < ApplicationController
  $baseUrl = "https://sandbox-api.credly.com/v1/organizations/#{ENV["ORG_ID"]}"
  $base64 = Base64::encode64("#{ENV["AUTH_TOKEN"]}:''")
  $headers = { 
    "Authorization" => "Basic " + $base64,
    "Accept": "application/json", 
    "Content-Type": "application/json" 
  }
  
  def get_badge_templates
    url = $baseUrl + "/badge_templates"
    response = RestClient.get(url, $headers)
    @jsonData = JSON.parse(response)["data"]
    render json: @jsonData
  end

  def issue_badge(email = 'testEmail@123.com', first_name, last_name, badge_template_id, issued_at = Time.new)
    url = $baseUrl + "/badges"
    body = {
      recipient_email: email,
      issued_to_first_name: first_name,
      issued_to_last_name: last_name,
      badge_template_id: badge_template_id,
      issued_at: issued_at,
    }
    response = RestClient.post(url, body, $headers)
    jsonData = JSON.parse(response)
    render json: jsonData
  end
end
