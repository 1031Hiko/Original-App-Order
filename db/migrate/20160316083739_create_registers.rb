class CreateRegisters < ActiveRecord::Migration
  def change
    create_table :registers do |t|
      t.integer  :brand_id
      t.integer  :season_id
      t.string   :confirmation_expired_date
      t.string   :delivery_term
      t.string   :payment_term
      t.string   :freight_company
      t.string   :transport_type
      t.string   :ship_type
      t.timestamps
    end
  end
end
