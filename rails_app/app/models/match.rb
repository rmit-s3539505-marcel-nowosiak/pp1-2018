class Match < ApplicationRecord
  belongs_to :HunterProfile, optional: true
  belongs_to :Listing, optional: true
end
