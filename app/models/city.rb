# frozen_string_literal: true

# app/models/city.rb
class City < ApplicationRecord
  has_many :temperatures, dependent: :destroy

  # Method to get recent temperatures, e.g., last 7 days
  def recent_temperatures(limit = 7)
    temperatures.order(date: :desc).limit(limit)
  end

  # Method to get the current temperature (assuming the most recent entry is the current one)
  def current_temperature
    temperatures.order(date: :desc).first
  end
end
