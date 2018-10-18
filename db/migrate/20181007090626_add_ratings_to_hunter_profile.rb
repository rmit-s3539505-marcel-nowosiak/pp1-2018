class AddRatingsToHunterProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :hunter_profiles, :rating, :float 
  end
end
