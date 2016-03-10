class Color < ActiveRecord::Base
  has_many :products_colors
  has_many :products, through: :products_colors
  has_many :sold_products
  has_many :posted_products, through: :products

end