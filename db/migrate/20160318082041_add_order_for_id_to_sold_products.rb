class AddOrderForIdToSoldProducts < ActiveRecord::Migration
  def change
    add_column :sold_products, :order_for_id, :integer
  end
end
