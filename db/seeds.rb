puts "Cleaning database..."
Cocktail.destroy_all
puts "Seeding database..."

# Ingredient.create(name: "lemon")
# Ingredient.create(name: "ice")
# Ingredient.create(name: "mint leaves")

require 'open-uri'
require 'json'
ingredients = JSON.parse(open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read)
ingredients['drinks'].each do |ingredient_hash|
  name = ingredient_hash["strIngredient1"]
  new_ingredient = Ingredient.new(name: name)
  new_ingredient.save
end


10.times do |cocktails|
  new_c = Cocktail.new(
    name: Faker::Ancient.titan,
    )
  new_c.save
end
