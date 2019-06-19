class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.datetime :due_date
      t.string :execution_date
      t.references :user,foreign_key: true
      t.boolean :done_flg

      t.timestamps
    end
  end
end
