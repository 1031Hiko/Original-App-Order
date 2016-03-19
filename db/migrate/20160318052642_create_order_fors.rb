class CreateOrderFors < ActiveRecord::Migration
  def change
    create_table :order_fors do |t|
       t.string :name
       t.integer :retailer_id
       t.integer :brand_id
       t.timestamps
    end
  end
end
