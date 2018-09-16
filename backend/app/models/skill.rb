class Skill < ApplicationRecord
  has_and_belongs_to_many :hunter_profiles
  has_and_belongs_to_many :listings

end
