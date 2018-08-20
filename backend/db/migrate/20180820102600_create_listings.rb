class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :body
      t.boolean :published
      t.int :min_salary
      t.float :max_salary
      t.string :location
      t.references :req_skill_set, foreign_key: true
      t.references :add_skill_set, foreign_key: true
      t.string :hours
      t.references :industry, foreign_key: true
      t.references :employer, foreign_key: true

      t.timestamps
    end
  end
end
