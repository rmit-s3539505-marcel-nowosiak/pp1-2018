class CreateHunterProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :hunter_profiles do |t|
      t.references :user, foreign_key: true
      t.string :location
      t.boolean :employed

      t.timestamps
    end
  end
end
