class Shop < ActiveRecord::Base
  has_attached_file :image, styles: {  large: "500x500#", :medium => "200x200#", :thumb => "100x100#" }, default_url: "default.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :category
  has_many :items
  belongs_to :user

  validates :name, :location, :description, :city, :country, :category_id, :image, :address, presence: true
end
