class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @user = 'https://mif-project.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to MIF, #{@user.first_name}')
end
