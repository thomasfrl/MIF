class HomeController < ApplicationController
  def index
    @cities = City.all
    @random_cities = City.all.sample
  end
end
