# Recipes Model and Repository Classes Design Recipe

## 1. Design and create the Table

> As a food lover,  
> So I can stay organised and decide what to cook,  
> I'd like to keep a list of all my recipes with their names.
>
> As a food lover,  
> So I can stay organised and decide what to cook,  
> I'd like to keep the average cooking time (in minutes) for each recipe.
>
> As a food lover,  
> So I can stay organised and decide what to cook,  
> I'd like to give a rating to each of the recipes (from 1 to 5).

```
Table: recipes

Columns:
id | name | cooking_time | rating
```

Create the table:
```sql
CREATE TABLE recipes (
  id SERIAL primary key,
  name text,
  cooking_time int,
  rating int
);
```

## 2. Create Test SQL seeds

```sql
TRUNCATE TABLE books RESTART IDENTITY;

-- Below this line there should only be `INSERT` statements.
-- Replace these statements with your own seed data.

INSERT INTO "recipes" ("id", "name", "cooking_time", "rating") VALUES (1, 'Corn Bread', 60, 4);
INSERT INTO "recipes" ("id", "name", "cooking_time", "rating") VALUES (2, 'Sweet Potato Curry', 90, 5);
INSERT INTO "recipes" ("id", "name", "cooking_time", "rating") VALUES (3, 'Apple Pie', 45, 4);
INSERT INTO "recipes" ("id", "name", "cooking_time", "rating") VALUES (4, 'Red Lentils Dahl', 45, 5);
```

Run this SQL file on the database to truncate (empty) the table, and insert the seed data. Be mindful of the fact any existing records in the table will be deleted.

```bash
psql -h 127.0.0.1 recipes_repository < seeds_recipes.sql
```

## 3. Define the class names

Usually, the Model class name will be the capitalised table name (single instead of plural). The same name is then suffixed by `Repository` for the Repository class name.

```ruby
# Table name: recipes

# Model class
# (in lib/recipe.rb)
class Recipe
end

# Repository class
# (in lib/recipe_repository.rb)
class RecipeRepository
end
```

## 4. Model class

```ruby
# Table name: recipes

# Model class
# (in lib/recipes.rb)

class Book
  attr_accessor :id, :name, :cooking_time, :rating
end
```

## 5. Repository Class interface

```ruby
# Table name: recipes

# Repository class
# (in lib/recipe_repository.rb)

class BookRepository

  # Selecting all records
  # No arguments
  def all
	# Executes the SQL query:
	# SELECT id, name, cooking_time, rating FROM recipes;

	# Returns an array of Recipe objects.
  end

  def find(id)
	  # Executes the SQL query:
	  # SELECT id, name, cooking_time, rating FROM recipes WHERE id = $1

	  # Returns the Recipe object for the record with the id indicated
  end
end
```

## 6. Test Examples

These examples will later be encoded as RSpec tests.

```ruby
# Get all recipes

repo = RecipeRepository.new

recipes = repo.all

recipes.length # =>  4

recipes.first.id # =>  1
recipes.first.name # =>  'Corn Bread'
recipes.first.cooking_time # =>  '60'
recipes.first.rating # =>  '4'

recipes.last.id # =>  4
recipes.last.name # =>  'Red Lentils Dahl'
recipes.last.cooking_time # =>  '45'
recipes.last.rating # =>  '5'

# Find recipe

repo = RecipeRepository.new
recipe_1 = repo.find(1)

recipe_1.id # =>  1
recipe_1.name # =>  'Corn Bread'
recipe_1.cooking_time # =>  '60'
recipe_1.rating # =>  '4'

recipe_3 = repo.find(3)

recipe_3.id # =>  3
recipe_3.name # =>  'Apple Pie'
recipe_3.cooking_time # =>  '45'
recipe_3.rating # =>  '4'
```