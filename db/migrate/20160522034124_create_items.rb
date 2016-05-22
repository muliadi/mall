class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.decimal :price
      t.string :location

      t.timestamps null: false
    end
    add_reference :items, :category, index: true
  end
end
