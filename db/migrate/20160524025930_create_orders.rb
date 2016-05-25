class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :address
      t.string :phone_number
      t.string :city

      t.timestamps null: false
    end
  end
end
