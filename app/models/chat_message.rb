class ChatMessage < ActiveRecord::Base
  belongs_to :user, polymorphic: true
  belongs_to :brand_retailer
end
