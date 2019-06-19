class NotNullToUser < ActiveRecord::Migration[5.1]
  def change
    change_column :users,:user_id,:string, null: false
    rename_column :users,:user_id,:user_name
  end
end
