class CreateRequiredSkillsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :listings, :skills do |t|
      t.index [:listing_id, :skill_id]
      # t.index [:skill_id, :listing_id]
    end
  end
end
