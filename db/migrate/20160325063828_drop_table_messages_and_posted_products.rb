class DropTableMessagesAndPostedProducts < ActiveRecord::Migration
  def change
    drop_table :messages
    drop_table :posted_products

  end
end
