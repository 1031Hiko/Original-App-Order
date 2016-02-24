class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :style_number
      t.integer :price 
      t.string :color 
      t.string :size 
      t.string :fabric
      t.timestamps 
    end
  end
end
