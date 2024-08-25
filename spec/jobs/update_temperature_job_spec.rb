# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateTemperatureJob, type: :job do
  let!(:city1) { City.create(name: 'Pune') }
  let!(:city2) { City.create(name: 'Mumbai') }

  before do
    # Clear temperature records and cities
    Temperature.delete_all
    City.delete_all

    # Recreate cities
    City.create(name: 'Pune')
    City.create(name: 'Mumbai')

    # Stub the WeatherService for each city
    allow(WeatherService).to receive(:new).with('Pune').and_return(double(fetch_temperature: [30.0, 18.5204, 73.8567]))
    allow(WeatherService).to receive(:new).with('Mumbai').and_return(double(fetch_temperature: [32.0, 19.0760,
                                                                                                72.8777]))
  end
  it 'calls WeatherService with the city name' do
    UpdateTemperatureJob.perform_now

    expect(WeatherService).to have_received(:new).with('Pune').once
    expect(WeatherService).to have_received(:new).with('Mumbai').once
  end

  it 'processes each city in order' do
    UpdateTemperatureJob.perform_now

    expect(WeatherService).to have_received(:new).with('Pune').ordered
    expect(WeatherService).to have_received(:new).with('Mumbai').ordered
  end
end
