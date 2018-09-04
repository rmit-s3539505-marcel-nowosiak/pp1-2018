class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.boolean :accepted
      t.boolean :offered
      t.boolean :application
      t.references :hunterprofile, foreign_key: true
      t.references :listing, foreign_key: true

      t.timestamps
    end
  end
end
