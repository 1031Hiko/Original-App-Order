class AddPostedProductIdAndSizeIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :posted_product_id, :integer
  end
end
