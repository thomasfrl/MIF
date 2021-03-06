class CitiesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :set_city, only: [:show]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.all
  end

  # GET /cities/1
  # GET /cities/1.json
  def show
    @city = City.find(params[:id])
    @cities = City.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end
end
