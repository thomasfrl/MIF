class UserMailer < ApplicationMailer
  default from: 'no-reply@monsite.fr'

  def welcome_email(user)
    @user = user
    @url = 'https://mif-project.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to MIF, #{@user.first_name}')
  end

end
