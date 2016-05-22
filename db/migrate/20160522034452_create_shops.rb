class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :name
      t.string :location

      t.timestamps null: false
    end
    add_reference :shops, :category, index: true
  end
end
