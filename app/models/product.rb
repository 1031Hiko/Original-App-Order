class Product < ActiveRecord::Base

  attr_accessor :size_id
  attr_accessor :color_id

  belongs_to :brand
  has_many :contracts
  has_many :posted_products
  accepts_nested_attributes_for :posted_products, allow_destroy: true

  has_many :products_colors
  has_many :products_sizes
  has_many :colors, through: :products_colors
  has_many :sizes, through: :products_sizes


  has_attached_file :image,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image,
                                      content_type: ["image/jpg","image/jpeg","image/png"]


end
