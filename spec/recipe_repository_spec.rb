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

  it '#all returns all records' do
    repo = RecipeRepository.new

    recipes = repo.all

    expect(recipes.length).to eq 4

    expect(recipes.first.id).to eq '1'
    expect(recipes.first.name).to eq 'Corn Bread'
    expect(recipes.first.cooking_time).to eq '60'
    expect(recipes.first.rating).to eq '4'

    expect(recipes.last.id).to eq '4'
    expect(recipes.last.name).to eq 'Red Lentils Dahl'
    expect(recipes.last.cooking_time).to eq '45'
    expect(recipes.last.rating).to eq '5'
  end

  it '#find return the record for the specified ID' do
    repo = RecipeRepository.new
    recipe_1 = repo.find(1)

    expect(recipe_1.id).to eq '1'
    expect(recipe_1.name).to eq 'Corn Bread'
    expect(recipe_1.cooking_time).to eq '60'
    expect(recipe_1.rating).to eq '4'

    recipe_3 = repo.find(3)

    expect(recipe_3.id).to eq '3'
    expect(recipe_3.name).to eq 'Apple Pie'
    expect(recipe_3.cooking_time).to eq '45'
    expect(recipe_3.rating).to eq '4'
  end
end
