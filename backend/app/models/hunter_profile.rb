class HunterProfile < ApplicationRecord
  #belongs_to :user, :foreign_key => "user_id"
  has_many :skill
  accepts_nested_attributes_for :skill, :allow_destroy => true
end
