class Size < ActiveRecord::Base
  # has_and_belongs_to_many :products
  has_many :products, through: :products_sizes
  has_many :products_sizes
  has_many :sold_products
  # belongs_to :product
  # has_many_through :products_sizes
end
