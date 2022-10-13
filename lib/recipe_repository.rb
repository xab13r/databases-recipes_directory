require_relative './recipe'

class RecipeRepository
  def all
    sql_query = 'SELECT id, name, cooking_time, rating FROM recipes'
    result_set = DatabaseConnection.exec_params(sql_query, [])

    recipes = []

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id']
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time']
      recipe.rating = record['rating']
      recipes.push(recipe)
    end

    recipes
  end

  def find(id)
    sql_query = 'SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1'
    paramater = [id]
    find_result = DatabaseConnection.exec_params(sql_query, paramater)[0]

    recipe = Recipe.new
    recipe.id = find_result['id']
    recipe.name = find_result['name']
    recipe.cooking_time = find_result['cooking_time']
    recipe.rating = find_result['rating']

    recipe
  end
end
