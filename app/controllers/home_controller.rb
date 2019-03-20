class HomeController < ApplicationController
    before_action :random_user

  def index
    @cities = City.all.slice(0...8)
    @random_cities = City.all.sample
    

  end

  def about_us
  end

  def contact
  end
  
  def team
  end

  def not_found
    render "404"
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




