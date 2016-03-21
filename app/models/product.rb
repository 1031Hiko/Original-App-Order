class Product < ActiveRecord::Base

  belongs_to :register
  belongs_to :size
  belongs_to :color
  belongs_to :brand
  has_many :contracts

  has_attached_file :image,
                      styles:  { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :image,
                                      content_type: ["image/jpg","image/jpeg","image/png"]
end