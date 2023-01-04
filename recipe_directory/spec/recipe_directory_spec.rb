require_relative '../lib/recipe_directory'

RSpec.describe RecipeDirectory do
  def reset_recipes_table
    seed_sql = File.read('spec/seeds_recipe_directory.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_recipes_table
  end

  it 'returns all recipes when calling the all method' do
    repo = RecipeDirectory.new

    recipes = repo.all
    expect(recipes[0].recipe_name).to eq 'Mushroom Omelette'
    expect(recipes.length).to eq 4
    expect(recipes[1].cooking_time).to eq '100'
    expect(recipes[2].rating).to eq '3'
  end

  it 'returns the specific recipe when calling find method' do
    repo = RecipeDirectory.new

    recipe = repo.find(1)
    expect(recipe.cooking_time).to eq '10'
  end
end
