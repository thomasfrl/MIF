class HomeController < ApplicationController
    before_action :random_user

  def index
    @cities = City.all.slice(0...8)
    @random_cities = City.all.sample
    random_user

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

    @users = User.all
    rand_users = []
    @user_matched = []
    @users.each do |user|
      if user != current_user
        if user.matchmaking(current_user) > 2
          rand_users << user
        end
      end
    end

    if rand_users.size < 8
      @user_matched += rand_users
    else
      8.times do
        @user_matched << rand_users.sample
      end
    end

    return @user_matched
  end
end




