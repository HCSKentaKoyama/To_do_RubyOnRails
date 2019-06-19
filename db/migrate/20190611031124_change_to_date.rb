class ChangeToDate < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks,:execution_date,:datetime
  end
end
