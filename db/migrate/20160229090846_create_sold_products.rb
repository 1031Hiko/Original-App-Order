class CreateSoldProducts < ActiveRecord::Migration
  def change
    create_table :sold_products do |t|
      t.string :brand_id
      t.string :retailer_id
      t.string :product_id
      t.string :color_id
      t.string :size_id
      t.string :quantity


      t.timestamps 
    end
  end
end
