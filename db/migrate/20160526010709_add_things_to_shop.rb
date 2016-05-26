class AddThingsToShop < ActiveRecord::Migration
  def change
    add_column :shops, :description, :text
    add_column :shops, :city, :string
    add_column :shops, :country, :string
    add_column :shops, :phone, :string
    add_column :shops, :address, :text
  end
end
