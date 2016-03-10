class Remove < ActiveRecord::Migration
  def change
    remove_column :products, :color, :string
    remove_column :products, :size, :string
  end
end
