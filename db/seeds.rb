# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
Review.destroy_all

50.times do |index|
  newProduct = Product.create!(name: Faker::Food.ingredient,
                               cost: Faker::Number.between(25, 2000),
                               country: Faker::GameOfThrones.city)
  10.times do |index|
    Review.create!(author: Faker::LordOfTheRings.character,
                   content_body: Faker::Hipster.paragraph(4, true, 4),
                   rating: Faker::Number.between(1, 100),
                   product_id: newProduct.id)
  end
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"