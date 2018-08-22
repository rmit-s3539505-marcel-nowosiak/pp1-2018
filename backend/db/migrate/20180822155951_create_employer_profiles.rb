class CreateEmployerProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :employer_profiles do |t|
      t.references :user, foreign_key: true
      t.string :location
      t.string :business_name

      t.timestamps
    end
  end
end
