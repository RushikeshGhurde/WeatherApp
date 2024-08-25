# frozen_string_literal: true

# spec/controllers/dashboard_controller_spec.rb
require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  let(:user) { create(:user) }
  let(:city) { create(:city) }
  let!(:temperature) { create(:temperature, city:, date: Date.today, temperature: 25) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    before do
      @recent_temperature = create(:temperature, city:, date: Date.yesterday, temperature: 22)
    end

    it 'assigns the requested city to @city' do
      get :show, params: { id: city.id }
      expect(assigns(:city)).to eq(city)
    end

    # it 'assigns recent temperatures to @recent_temperatures' do
    #   get :show, params: { id: city.id }
    #   expect(assigns(:recent_temperatures)).to include(@recent_temperature)
    # end

    it 'assigns recent temperatures to @recent_temperatures' do
      get :show, params: { id: city.id }

      # Debugging
      puts 'Recent Temperatures:'
      assigns(:recent_temperatures).each { |temp| puts temp.inspect }

      puts 'Expected Temperature:'
      puts @recent_temperature.inspect

      normalized_recent_temperatures = assigns(:recent_temperatures).map do |temp|
        temp.attributes.slice('date', 'temperature').merge('date' => temp.date.strftime('%Y-%m-%d'))
      end

      normalized_recent_temperature = @recent_temperature.attributes.slice('date',
                                                                           'temperature').merge('date' => @recent_temperature.date.strftime('%Y-%m-%d'))

      expect(normalized_recent_temperatures).to include(hash_including(normalized_recent_temperature))
    end


    it 'assigns the current temperature to @current_temperature' do
      get :show, params: { id: city.id }
      expect(assigns(:current_temperature)).to eq(temperature)
    end

    it 'renders the show template' do
      get :show, params: { id: city.id }
      expect(response).to render_template(:show)
    end
  end
end
