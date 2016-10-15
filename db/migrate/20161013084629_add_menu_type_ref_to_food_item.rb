class AddMenuTypeRefToFoodItem < ActiveRecord::Migration[5.0]
  def change
    add_reference :food_items, :menu_type, foreign_key: true
  end
end
