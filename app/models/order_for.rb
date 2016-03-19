class OrderFor < ActiveRecord::Base
  belongs_to :retailer
  belongs_to :brand

  has_many :sold_products
  has_many :products, through: :sold_products

  accepts_nested_attributes_for :sold_products, allow_destroy: true, reject_if: :reject_posts

  def reject_posts(attributed)
    attributed['product_id'].blank?
  end

  def total_price
    sold_products.to_a.sum { |sold_product| sold_product.total_price }
  end
end
