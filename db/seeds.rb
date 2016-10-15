# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#MenuType.create ([{name: 'Breakfast'},{name: 'Lunch'},{name: 'Dinner'},{name: 'Drinks'}])

MenuType.all.each do |menu_type|
  rand(100).times do
    menu_type.food_items.create! name: Faker::Hipster.word, description: Faker::Hipster.sentence, price: Faker::Number.between(50000, 200000), image_url: 'http://i.imgur.com/w6ATZuY.jpg'
  end
end
