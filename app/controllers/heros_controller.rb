class HerosController < ApplicationController
  require 'rest-client'
  require 'digest'

  require "uri"
  require "net/http"
  # Retrieve HEROES from MARVEL API
  def get_heros
    baseUrl = 'http://gateway.marvel.com/v1/public/characters?'
    timestamp = Time.new.sec.to_s
    hash = Digest::MD5.hexdigest (timestamp + ENV["PRIVATE_KEY"] + ENV["PUBLIC_KEY"])
    str = "ts=#{timestamp}&apikey=#{ENV["PUBLIC_KEY"]}&hash=#{hash}"
    response = RestClient.get(baseUrl + str)
    jsonData = JSON.parse(response)["data"]
    render json: jsonData
  end

  # def get_badges
  #   url = URI("https://sandbox-api.credly.com/v1/organizations/99/badges.json")

  #   https = Net::HTTP.new(url.host, url.port)
  #   https.use_ssl = true
    
  #   request = Net::HTTP::Get.new(url)
  #   form_data = [['email', 'irosen419@gmail.com'],['password', 'Python419!']]
  #   request.set_form form_data, 'multipart/form-data'
  #   response = https.request(request)
  #   puts response.read_body
  # end

end