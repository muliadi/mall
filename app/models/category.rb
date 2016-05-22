class Category < ActiveRecord::Base
  has_many :items
  has_many :shops

  validates :name, presence: true
end
