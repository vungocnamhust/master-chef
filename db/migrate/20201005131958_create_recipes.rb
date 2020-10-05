class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.text :description
      t.string :name
      t.string :avatar_url
      t.integer :chef_id

      t.timestamps
    end
  end
end
