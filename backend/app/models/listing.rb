class Listing < ApplicationRecord
  # belongs_to :req_skill_set
  # belongs_to :add_skill_set
  # belongs_to :industry
  belongs_to :employer
  has_and_belongs_to_many :hunter_profiles
  has_and_belongs_to_many :skills

  def get_required_skills
    # self.required_skills # some way of returning a set of skills
    ['skill one'] # placeholder
  end
end
