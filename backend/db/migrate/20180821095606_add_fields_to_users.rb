class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :business_name, :string
    add_column :users, :business_position, :string
    add_column :users, :business_address, :string
  end
end
