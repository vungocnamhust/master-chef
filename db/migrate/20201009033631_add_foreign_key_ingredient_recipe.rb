class AddForeignKeyIngredientRecipe < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :ingredient_recipes, :ingredients, column: :ingredient_id
    add_foreign_key :ingredient_recipes, :recipes, column: :recipe_id
  end
end
