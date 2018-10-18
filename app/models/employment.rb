class Employment < ApplicationRecord
  belongs_to :listing
  belongs_to :hunter_profile

  # def offer(hunter)
  #   @employment = Employment.find(hunter_id: hunter.id)
  #   @employment.offer = true
  # end
end
