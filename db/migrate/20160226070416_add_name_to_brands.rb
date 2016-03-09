class AddNameToBrands < ActiveRecord::Migration
  def change
    add_column :contracts, :product_id, :integer
  end
end
