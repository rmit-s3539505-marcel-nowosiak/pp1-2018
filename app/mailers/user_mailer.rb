class UserMailer < ApplicationMailer
  default from: 'notifications@' + ENV['APP_NAME'].to_s + '.com' unless ENV['APP_NAME'].nil?

  def welcome_email
    @user = params[:user] 
    @url  = 'http://' + ENV['APP_NAME'].to_s + '.com/login' unless ENV['APP_NAME'].nil?
    mail(to: @user.email, subject: 'Welcome to HireMe!') unless @user.nil?
  end
end
