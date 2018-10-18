class HunterProfile < ApplicationRecord
  belongs_to :user, :foreign_key => "user_id"
  has_and_belongs_to_many :skills, :through => :hunter_profiles_skills
  accepts_nested_attributes_for :skills, :allow_destroy => true

  has_many :employments

  def offer(listing)
    Employment.create(self, listing)
  end

  def listings
    Employment.where(hunter_profile_id: self.id)
  end
end
