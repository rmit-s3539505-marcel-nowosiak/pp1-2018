class CreateMatchesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :hunter_profiles, :listings do |t|
      t.index [:hunter_id, :listing_id]
      t.boolean :accepted # indicates whether the offer was accepted
      t.boolean :application # indicates if the request to match came from the hunter
      # t.index [:listing_id, :hunterprofile_id]
    end
  end
end
