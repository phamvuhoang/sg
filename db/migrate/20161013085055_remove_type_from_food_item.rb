class RemoveTypeFromFoodItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :food_items, :type, :integer
  end
end
