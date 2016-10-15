class CreateFoodItems < ActiveRecord::Migration[5.0]
  def change
    create_table :food_items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.integer :type
      t.string :image_url

      t.timestamps
    end
  end
end