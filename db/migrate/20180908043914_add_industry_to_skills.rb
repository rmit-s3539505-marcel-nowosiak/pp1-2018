class AddIndustryToSkills < ActiveRecord::Migration[5.2]
  def change
    add_column :skills, :industry, :string
  end
end
