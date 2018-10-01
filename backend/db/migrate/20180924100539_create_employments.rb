class CreateEmployments < ActiveRecord::Migration[5.2]
  def change
    create_table :employments do |t|
      t.references :listing, foreign_key: true
      t.references :hunter_profile, foreign_key: true
      t.boolean :offer

      t.timestamps
    end
  end
end
