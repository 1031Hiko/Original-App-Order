class AddRegisterIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :register_id, :integer
    remove_column :products, :posted_product_id, :integer
  end
end
