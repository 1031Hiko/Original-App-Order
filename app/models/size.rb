class Size < ActiveRecord::Base

  has_many :products
  has_many :products, through: :products_sizes
  has_many :products_sizes
  has_many :sold_products

end
