class AddRememberDigestToChef < ActiveRecord::Migration[6.0]
  def change
    add_column :chefs, :remember_digest, :string
  end
end
