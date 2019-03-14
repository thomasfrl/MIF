class HomeController < ApplicationController
    before_action :random_user

  def index
    @cities = City.all
    @random_cities = City.all.sample

  end

  private

  def random_user
  users = []
    10.times do
      users << User.all.sample
    end
  @users = users

  end
end




