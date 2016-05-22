class Item < ActiveRecord::Base
  belongs_to :category

  validates :name, :description, :price, :location, presence: true

  def self.search(params)
    if params[:category].present?
      items = Item.where(category_id: params[:category].to_i)
      items = items.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
      # items = Item.where(params[:location], 20) is params[:location].present?
    else
      items = Item.where("name like ? or description like ?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    end
    items
  end
end
