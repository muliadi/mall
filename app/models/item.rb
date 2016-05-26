class Item < ActiveRecord::Base

  has_attached_file :image, styles: { large: "500x500#", :medium => "200x200#", :thumb => "100x100#" }, default_url: "default.jpg"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  belongs_to :category
  belongs_to :user
  belongs_to :shop

  validates :name, :description, :price, :location, :category_id, presence: true

  def self.search(params)
    if params[:category].present?
      items = Item.where(category_id: params[:category].to_i)
      items = items.where("name like ? or description like ? user like", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      # items = Item.where(params[:location], 20) is params[:location].present?
    else
      items = Item.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    end
    items
  end
end
