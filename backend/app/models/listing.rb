class Listing < ApplicationRecord
  belongs_to :employer_profile

  has_many :employments
  has_and_belongs_to_many :skills, :through => :listings_skills

  def get_required_skills
    # self.required_skills # some way of returning a set of skills
    self.skills
  end

  def offer(hunter)
    Employment.create(hunter, self)
  end

  def hunters
    # return all the listings from the employments table
    Employment.where(listing_id: self.id)
  end
end
