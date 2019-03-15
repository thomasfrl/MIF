class HomeController < ApplicationController
    before_action :random_user

  def index
    @cities = City.all
    @random_cities = City.all.sample
    flash[:notice] = "Tell a friend about us"

  end

  def about_us
  end

  def contact
  end
  
  def team
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




