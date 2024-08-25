# frozen_string_literal: true

# app/services/weather_service.rb
class WeatherService
  require 'uri'
  require 'net/http'

  def initialize(city_name)
    @city_name = city_name
  end

  def fetch_temperature
    url = URI("http://api.weatherstack.com/current?access_key=c83dbe27c4d3ad91d5234d78cc347245&query=#{@city_name}")

    http = Net::HTTP.new(url.host, url.port)
    request = Net::HTTP::Get.new(url)

    response = http.request(request)
    response_body = JSON.parse(response.read_body)
    [response_body&.dig('current')&.dig('temperature'), response_body&.dig('location')&.dig('lat'),
     response_body&.dig('location')&.dig('lon')]
  end
end
