class ChangeUserIdColumnNameOfMessageTable < ActiveRecord::Migration[5.0]
  def change
    rename_column :messages, :sender_id, :user_id
  end
end
