class DropColumnsFromUsers < ActiveRecord::Migration[5.2]
  def down
    remove_columns :users, :email_confirmed, :confirm_token
  end
end
