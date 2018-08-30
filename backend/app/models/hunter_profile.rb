class HunterProfile < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  has_many :hunter_profiles_skills
  has_many :skill, through :hunter_profiles_skills
  accepts_nested_attributes_for :skill, :allow_destroy => true
end
