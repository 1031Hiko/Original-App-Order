class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.string   :order_date
      t.string   :confirmation_expired_day
      t.string   :payment_term
      t.string   :freight_company
      t.string   :transport_type
      t.string   :ship_type
      t.string   :status
      t.integer  :brand_id
      t.integer  :retailer_id

      t.timestamps null: false
    end
  end
end
