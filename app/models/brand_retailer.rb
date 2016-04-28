class BrandRetailer < ActiveRecord::Base
  belongs_to :brand
  belongs_to :retailer
  has_many :chat_messages, foreign_key: "group_id"
end
