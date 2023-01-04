class Recipe
  def initialize(id, recipe_name, cooking_time, rating)
    @id = id
    @recipe_name = recipe_name
    @cooking_time = cooking_time
    @rating = rating
  end

  attr_accessor :id, :recipe_name, :cooking_time, :rating
end
