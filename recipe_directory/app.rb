require_relative 'lib/database_connection'
require_relative 'lib/recipe_directory'

DatabaseConnection.connect('recipes_directory')

recipes_directory = RecipeDirectory.new

recipes_directory.all.each do |recipe|
  p "#{recipe.id} - #{recipe.recipe_name} - Cooking time: #{recipe.cooking_time.to_i / 60} hours #{recipe.cooking_time.to_i % 60} mins (Rating: #{recipe.rating} stars)"
end
