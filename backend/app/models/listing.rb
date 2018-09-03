class Listing < ApplicationRecord
  # belongs_to :req_skill_set
  # belongs_to :add_skill_set
  # belongs_to :industry
  # belongs_to :employer

  # clear the cache every time a new listing is created
  after_save :clear_cache

  def clear_cache
    REDIS.del "categories"
  end
end
