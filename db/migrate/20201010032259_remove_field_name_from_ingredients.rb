class RemoveFieldNameFromIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :recipe_id, :integer
  end
end
