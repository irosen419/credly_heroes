class HerosController < ApplicationController
  require 'rest-client'
  require 'digest'

  # Retrieve HEROES from MARVEL API
  def get_heros
    baseUrl = 'http://gateway.marvel.com/v1/public/characters?'
    timestamp = Time.new.sec.to_s
    hash = Digest::MD5.hexdigest (timestamp + ENV["PRIVATE_KEY"] + ENV["PUBLIC_KEY"])
    str = "ts=#{timestamp}&apikey=#{ENV["PUBLIC_KEY"]}&hash=#{hash}"
    response = RestClient.get(baseUrl + str)
    render json: response
  end

end
