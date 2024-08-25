# frozen_string_literal: true

# app/controllers/dashboard_controller.rb
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
    @recent_temperatures = @city.temperatures
                                .select('date, MAX(temperature) as temperature')
                                .group('date')
                                .order(date: :desc)
    @current_temperature = @city.current_temperature
  end
end
