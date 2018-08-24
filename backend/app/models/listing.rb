class Listing < ApplicationRecord
  belongs_to :req_skill_set
  belongs_to :add_skill_set
  belongs_to :industry
  belongs_to :employer
  has_and_belongs_to_many :hunterprofiles
end
