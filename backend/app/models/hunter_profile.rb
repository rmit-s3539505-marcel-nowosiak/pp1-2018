class HunterProfile < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  has_many :skills, :through => :hunter_profiles_skills
  accepts_nested_attributes_for :skills, :allow_destroy => true

  has_and_belongs_to_many :listings, :through => :hunter_profiles_listings


end
