require_relative 'recipe'

class RecipeDirectory
  def all
    sql = 'SELECT * FROM recipes'
    results_set = DatabaseConnection.exec_params(sql, [])

    recipes = []
    results_set.each do |record|
      recipe = Recipe.new(record['id'], record['recipe_name'], record['cooking_time'], record['rating'])
      recipes << recipe
    end
    recipes
  end

  def find(id)
    sql = 'SELECT * FROM recipes WHERE id = $1'
    sql_param = [id]
    results_set = DatabaseConnection.exec_params(sql, sql_param)
    record = results_set[0]
    Recipe.new(record['id'], record['recipe_name'], record['cooking_time'], record['rating'])
  end
end
