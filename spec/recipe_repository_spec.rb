require 'recipe_repository'

RSpec.describe RecipeRepository do
	def reset_recipes_table
		seed_sql = File.read('spec/seeds_recipes.sql')
		connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
		connection.exec(seed_sql)
	end

	before(:each) do
		reset_recipes_table
	end

	it "" do
	end

end