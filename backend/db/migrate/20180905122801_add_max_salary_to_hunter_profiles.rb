class AddMaxSalaryToHunterProfiles < ActiveRecord::Migration[5.2]
  def change
    add_column :hunter_profiles, :max_salary, :integer
  end
end
