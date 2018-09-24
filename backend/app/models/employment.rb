class Employment < ApplicationRecord
  belongs_to :listing
  belongs_to :hunter_profile
end
