class AddContractIdToSoldProducts < ActiveRecord::Migration
  def change
    add_column :sold_products, :contract_id, :integer
  end
end
