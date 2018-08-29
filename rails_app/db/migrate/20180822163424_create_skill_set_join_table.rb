class CreateSkillSetJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :hunter_profiles, :skills do |t|
      t.index [:hunter_profile_id, :skill_id]
      # t.index [:skill_id, :hunter_profile_id]
    end
  end
end
