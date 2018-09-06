class CreateOfferedJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :listings, :hunter_profiles do |t|
      # t.index [:listing_id, :hunter_profile_id]
      t.index [:hunter_profile_id, :listing_id]
    end
  end
end
