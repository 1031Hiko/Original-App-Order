class RemoveQuantityFromSoldProducts < ActiveRecord::Migration
  def change
    remove_column :sold_products, :quantity, :string
    add_column :sold_products, :quantity, :integer
  end
end
