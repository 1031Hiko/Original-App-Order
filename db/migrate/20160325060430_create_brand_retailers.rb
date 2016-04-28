class CreateBrandRetailers < ActiveRecord::Migration
  def change
    create_table :brand_retailers do |t|
      t.integer :brand_id
      t.integer :retailer_id
      t.timestamps 
    end
  end
end
