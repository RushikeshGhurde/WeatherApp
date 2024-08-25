# frozen_string_literal: true

# app/jobs/update_temperature_job.rb
class UpdateTemperatureJob < ApplicationJob
  queue_as :default

  def perform
    City.find_each do |city|
      temperature, lat, lon = WeatherService.new(city.name).fetch_temperature
      if temperature
        city.update(latitude: lat, longitude: lon) if lat.present? && lon.present?
        city.temperatures.create(date: Date.today, temperature:)
      end
    end
  end
end
