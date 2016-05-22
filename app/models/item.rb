class Item < ActiveRecord::Base
  belongs_to :category

  validates :name, :description, :price, :location, presence: true

  def self.search(params)
    items = Item.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
  end
end
