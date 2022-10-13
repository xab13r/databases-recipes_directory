require_relative 'lib/recipe_repository'
require_relative 'lib/database_connection'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('recipes_directory')

repo = RecipeRepository.new
recipes = repo.all
recipe_1 = repo.find(1)
recipe_4 = repo.find(4)

puts 'Here are all your recipes:'
recipes.each do |recipe|
  puts "#{recipe.id} - #{recipe.name} - #{recipe.cooking_time}min - #{recipe.rating}/5"
end

puts "\nHere is the recipe with id 1:"
puts "#{recipe_1.id} - #{recipe_1.name} - #{recipe_1.cooking_time}min - #{recipe_1.rating}/5"
puts "\nHere is the recipe with id 4:"
puts "#{recipe_4.id} - #{recipe_4.name} - #{recipe_4.cooking_time}min - #{recipe_4.rating}/5"
