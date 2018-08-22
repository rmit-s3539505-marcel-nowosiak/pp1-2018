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
end
