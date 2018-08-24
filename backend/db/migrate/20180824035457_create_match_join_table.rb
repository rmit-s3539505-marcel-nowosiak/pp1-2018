class CreateMatchJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :hunter, :listings do |t|
      t.index [:hunter_id, :listing_id]
      # t.index [:listing_id, :hunterprofile_id]
    end
  end
end
