class Task < ApplicationRecord
    validates :task_name, presence: true
    validates :due_date, presence: true
    validates :execution_date, presence: true
end
