class CreateProductsColors < ActiveRecord::Migration
  def change
    create_table :products_colors do |t|
      t.string :product_id
      t.string :color_id

      t.timestamps 
    end
  end
end
