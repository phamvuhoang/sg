class ChangeColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :menu_types, :type, :name
  end
end
