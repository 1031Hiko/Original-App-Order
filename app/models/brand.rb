class Brand < ActiveRecord::Base
has_many :products
has_many :posted_products
has_many :posted_products, through: :products
has_many :contracts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]
end
