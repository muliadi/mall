class Shop < ActiveRecord::Base
  belongs_to :category

  validates :name, :location, presence: true
end
