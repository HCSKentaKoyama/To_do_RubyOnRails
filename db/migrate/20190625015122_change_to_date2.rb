class ChangeToDate2 < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks,:execution_date,:date
    change_column :tasks,:due_date,:date
  end
end
