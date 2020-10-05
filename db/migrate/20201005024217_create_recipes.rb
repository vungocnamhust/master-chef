class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.integer :chef_id
      t.text :description
      t.string :name
      t.string :avatar_url

      t.timestamps
    end
    add_foreign_key :recipes, :chefs, column: :chef_id
  end
end
