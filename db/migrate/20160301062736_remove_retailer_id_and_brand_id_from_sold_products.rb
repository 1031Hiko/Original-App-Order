class RemoveRetailerIdAndBrandIdFromSoldProducts < ActiveRecord::Migration
  def change
     remove_column :sold_products, :brand_id, :string
     remove_column :sold_products, :retailer_id, :string
  end
end
