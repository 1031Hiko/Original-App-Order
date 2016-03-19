class Register < ActiveRecord::Base
  belongs_to :brand
  has_many :products
  accepts_nested_attributes_for :products, allow_destroy: true, reject_if: :reject_posts

 def reject_posts(attributed)
   attributed['style_number'].blank?
 end
end
