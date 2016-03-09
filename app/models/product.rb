class Product < ActiveRecord::Base

  attr_accessor :size_id
  attr_accessor :color_id

# after_create :create_products_color
# after_create :create_products_size

  belongs_to :brand
  has_many :contracts
  # has_and_belongs_to_many :colors
  # has_and_belongs_to_many :sizes
  # has_many :colors
  # has_many :sizes
  # has_many_through :products_colors
  # has_many_through :products_sizes
  has_many :products_colors
  has_many :products_sizes
  has_many :colors, through: :products_colors
  has_many :sizes, through: :products_sizes

  has_attached_file :image,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image,
                                      content_type: ["image/jpg","image/jpeg","image/png"]

# private
# def create_products_color
#   binding.pry
#   self.products_color = Products_color.create(product_id: id)
# end 

# def create_products_size
# self.products_size = Products_size.create(product_id: id)
# end


end
