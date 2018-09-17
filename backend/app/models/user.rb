class User < ApplicationRecord
  rolify
  has_one :employer_profile
  has_one :hunter_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  def is_employer?
    #   # return true iff the employer table has a reference to this user's ID
    if User.find(self.id).employer_profile
      true
    end
  end
  
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user]=user
  end

  def set_current_user
    User.current = current_user
  end

  # call the welcome_email method after a new user signs up
  def after_confirmation
    # welcome_email
    # queue_matches
  end

  private
  # send a welcome_email at a later time
  # def welcome_email
  #   UserMailer.with(user: @user).welcome_email.deliver_later
  # end
end
