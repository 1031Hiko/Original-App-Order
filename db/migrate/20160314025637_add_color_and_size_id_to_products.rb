class AddColorAndSizeIdToProducts < ActiveRecord::Migration
  def change
    add_column :products, :color_id, :integer
    add_column :products, :size_id, :integer
  end
end
