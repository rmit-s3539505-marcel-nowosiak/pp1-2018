class Listing < ApplicationRecord
  belongs_to :employer_profile

  has_and_belongs_to_many :hunter_profiles
  has_and_belongs_to_many :skills

  def get_required_skills
    # self.required_skills # some way of returning a set of skills
    ['skill one'] # placeholder
  end
end
