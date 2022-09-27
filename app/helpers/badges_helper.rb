module BadgesHelper
  require 'rest-client'
  require 'digest'
  $credlyUrl = "https://sandbox-api.credly.com/v1/organizations/#{ENV["ORG_ID"]}"
  $base64 = Base64::encode64("#{ENV["AUTH_TOKEN"]}:''")
  $headers = { 
    "Authorization" => "Basic " + $base64,
    "Accept": "application/json", 
    "Content-Type": "application/json" 
  }

  def get_templates
    url = $credlyUrl + "/badge_templates"
    response = RestClient.get(url, $headers)
    JSON.parse(response)["data"]
  end

  def post_badge(email, first_name, last_name, badge_template_id, issued_at)
    url = $credlyUrl + "/badges"
    body = {
      "recipient_email": email,
      "issued_to_first_name": first_name,
      "issued_to_last_name": last_name,
      "badge_template_id": badge_template_id,
      "issued_at": issued_at,
    }
    response = RestClient.post(url, body, $headers)
    JSON.parse(response)
  end

  def get_badges(email)
    url = $credlyUrl + "/badges?filter=recipient_email::#{email}"
    response = RestClient.get(url, $headers)
    JSON.parse(response)
  end

end
