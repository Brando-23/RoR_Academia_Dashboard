class ChangeStatusToStringInTasks < ActiveRecord::Migration[6.1]
  def up
    # Change type from boolean to string
    change_column :tasks, :status, :string, default: "pending"
  end

  def down
    # Rollback: change string back to boolean
    change_column :tasks, :status, :boolean
  end
end