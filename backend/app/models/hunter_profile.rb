class HunterProfile < ApplicationRecord
  belongs_to :user
  has_many :skills, :dependent => :destroy
  accepts_nested_attributes_for :questions, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
