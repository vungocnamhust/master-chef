class AddColumnForChefTable < ActiveRecord::Migration[6.0]
  def change
    add_column :chefs, :name, :string
    add_column :chefs, :phone, :integer
    add_column :chefs, :mail, :text
    add_column :chefs, :password, :text
  end
end
