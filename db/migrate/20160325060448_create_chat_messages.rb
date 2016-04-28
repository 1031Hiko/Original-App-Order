class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages do |t|
      t.text :text
      t.integer :group_id
      t.integer :user_id
      t.string :user_type
      t.timestamps
    end
  end
end
