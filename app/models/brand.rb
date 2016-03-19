class Brand < ActiveRecord::Base
has_many :registers
has_many :products, through: :registers

has_many :contracts

has_many :order_fors

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>"}
  validates_attachment_content_type :avatar, content_type: ["image/jpg","image/jpeg","image/png"]
end
