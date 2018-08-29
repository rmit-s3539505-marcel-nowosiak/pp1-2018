class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # def is_employer?
  #   # return true iff the employer table has a reference to this user's ID
  #   # true if Employer.find_by(:user_id => self.id) # psuedocode
  # end

  # call the welcome_email method after a new user signs up
  def after_confirmation
    welcome_email
    queue_matches
  end

  private
  # send a welcome_email at a later time
  def welcome_email
    UserMailer.with(user: @user).welcome_email.deliver_later
  end

  # queue alll the matches a user has at a later time
  def queue_matches
    
  end
end
