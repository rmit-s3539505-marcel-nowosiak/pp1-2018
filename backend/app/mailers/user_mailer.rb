class UserMailer < ApplicationMailer
  default from: 'notifications@' + ENV['APP_NAME'] + '.com'

  def welcome_email
    @user = params[:user]
    @url  = 'http://' + ENV['APP_NAME'] + '.com/login'
    mail(to: @user.email, subject: 'Welcome to ' + ENV['APP_NAME'])
  end
end
