class AddPriceToSoldProducts < ActiveRecord::Migration
  def change
    add_column :sold_products, :price, :integer
  end
end
