class CreatePostedProducts < ActiveRecord::Migration
  def change
    create_table :posted_products do |t|
      t.string     :style_number
      t.integer    :price
      t.integer    :color_id
      t.integer    :size_id
      t.string     :fabric
      t.integer    :brand_id
      t.integer    :product_id
      t.attachment :image
      t.timestamps
    end
  end
end
