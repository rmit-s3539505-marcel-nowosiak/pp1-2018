class CreateHunterProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :hunter_profiles do |t|
      t.references :user, foreign_key: true
      t.string :location
      t.float :min_salary
      t.string :hours
      
      t.timestamps
    end
  end
end
