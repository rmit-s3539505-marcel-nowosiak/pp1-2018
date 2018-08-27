class HunterProfile < ApplicationRecord
  belongs_to :user
  has_many :skill, :dependent => :destroy
  accepts_nested_attributes_for :skill , :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
