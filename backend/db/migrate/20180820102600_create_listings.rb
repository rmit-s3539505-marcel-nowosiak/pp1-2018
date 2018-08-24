class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.boolean :accepted # indicates whether the offer was accepted
      t.boolean :application # true if the request to match came from a hunter
      t.float :min_salary
      t.float :max_salary
      t.string :location
      t.string :hours
      # t.references :req_skill_set, foreign_key: true
      # t.references :add_skill_set, foreign_key: true
      # t.references :industry, foreign_key: true
      # t.references :employer, foreign_key: true

      t.timestamps
    end
  end
end
