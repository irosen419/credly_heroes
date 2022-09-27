module HerosHelper
  require 'rest-client'
  $baseUrl = 'http://gateway.marvel.com/v1/public/characters'
  $timestamp = Time.new.sec.to_s
  $hash = Digest::MD5.hexdigest ($timestamp + ENV["PRIVATE_KEY"] + ENV["PUBLIC_KEY"])
  $str = "?limit=50&ts=#{$timestamp}&apikey=#{ENV["PUBLIC_KEY"]}&hash=#{$hash}"

  def get_heroes
    response = RestClient.get($baseUrl + $str)
    JSON.parse(response)["data"]["results"]
  end

  def get_hero(id)
    response = RestClient.get($baseUrl + "/" + id + $str)
    JSON.parse(response)["data"]["results"][0]
  end

  def query_hero(name)
    response = RestClient.get($baseUrl + $str + "&name=#{name}")
    JSON.parse(response)["data"]["results"][0]
  end

end
