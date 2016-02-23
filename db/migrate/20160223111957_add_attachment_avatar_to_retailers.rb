class AddAttachmentAvatarToRetailers < ActiveRecord::Migration
  def self.up
    change_table :retailers do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :retailers, :avatar
  end
end
