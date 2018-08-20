class Listing < ApplicationRecord
  belongs_to :req_skill_set
  belongs_to :add_skill_set
  belongs_to :industry
  belongs_to :employer
end
