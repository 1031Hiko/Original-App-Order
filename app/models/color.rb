class Color < ActiveRecord::Base
  # has_and_belongs_to_many :products
  has_many :products_colors
  has_many :products, through: :products_colors
  has_many :sold_products
  # belongs_to :product
  # has_many_through :products_color
end