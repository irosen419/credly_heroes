class HerosController < ApplicationController
  require 'rest-client'
  require 'digest'

  require "uri"
  require "net/http"

  $baseUrl = 'http://gateway.marvel.com/v1/public/characters'
  $timestamp = Time.new.sec.to_s
  $hash = Digest::MD5.hexdigest ($timestamp + ENV["PRIVATE_KEY"] + ENV["PUBLIC_KEY"])
  $str = "?ts=#{$timestamp}&apikey=#{ENV["PUBLIC_KEY"]}&hash=#{$hash}"


  # Retrieve HEROES from MARVEL API
  def index
    response = RestClient.get($baseUrl + $str)
    @heroes = JSON.parse(response)["data"]["results"]
  end

  def show
    @hero = RestClient.get($baseUrl + "/" + params[:id] + $str)
    render json: @hero
  end

  def find_hero
    hero_name = params["hero"]
    response = RestClient.get($baseUrl + $str + "%limit=50&name=#{hero_name}")
    @hero = JSON.parse(response)["data"]["results"][0]
    redirect_to hero_path(@hero["id"])
    
  end

  # def get_badges
  #   url = URI("https://sandbox-api.credly.com/v1/organizations/99/badges.json")

  #   https = Net::HTTP.new(url.host, url.port)
  #   https.use_ssl = true
    
  #   request = Net::HTTP::Get.new(url)
  #   form_data = [['email', 'irosen419$gmail.com'],['password', 'Python419!']]
  #   request.set_form form_data, 'multipart/form-data'
  #   response = https.request(request)
  #   puts response.read_body
  # end

  private

  def search_params
    params.require(:hero).permit(:id, :name, :thumbnail)
  end
end