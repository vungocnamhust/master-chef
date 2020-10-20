class AddForeignKeyToIngredientRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredient_recipes, :recipe_id, :integer
    add_column :ingredient_recipes, :ingredient_id, :integer
  end
end
