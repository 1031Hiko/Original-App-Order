class CreateProductsSizes < ActiveRecord::Migration
  def change
    create_table :products_sizes do |t|
      t.string :product_id
      t.string :size_id

      t.timestamps 
    end
  end
end
