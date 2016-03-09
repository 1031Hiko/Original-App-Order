class RemoveProductIdFromContracts < ActiveRecord::Migration
  def change
    remove_column :contracts, :product_id, :integer
  end
end
