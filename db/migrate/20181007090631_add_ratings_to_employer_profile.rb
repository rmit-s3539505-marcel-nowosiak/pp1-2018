class AddRatingsToEmployerProfile < ActiveRecord::Migration[5.2]
  def change
    add_column :employer_profiles, :rating, :float
  end
end
