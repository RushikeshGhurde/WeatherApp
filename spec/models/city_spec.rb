# frozen_string_literal: true

require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { City.create(name: 'Test City') }

  before do
    # Create temperature records for different dates
    (1..10).each do |i|
      city.temperatures.create(date: Date.today - i.days, temperature: i * 10)
    end
  end

  describe '#recent_temperatures' do
    it 'returns the most recent temperatures up to the specified limit' do
      recent_temps = city.recent_temperatures(7)

      expect(recent_temps.count).to eq(7)
      expect(recent_temps.first.temperature).to eq(10) # Temperature from 1 day ago
      expect(recent_temps.last.temperature).to eq(70)  # Temperature from 7 days ago
    end

    it 'returns the correct number of recent temperatures by default' do
      recent_temps = city.recent_temperatures

      expect(recent_temps.count).to eq(7)
    end
  end

  describe '#current_temperature' do
    it 'returns the most recent temperature record' do
      current_temp = city.current_temperature

      expect(current_temp.temperature).to eq(10) # Most recent temperature (1 day ago)
    end

    it 'returns nil if there are no temperatures' do
      city.temperatures.destroy_all
      current_temp = city.current_temperature

      expect(current_temp).to be_nil
    end
  end
end
