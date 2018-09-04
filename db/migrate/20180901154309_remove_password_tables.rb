class RemovePasswordTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :password
    remove_column :users, :password_confirmation 
  end
end
