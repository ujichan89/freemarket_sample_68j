class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.string :status
      t.text :description
      t.string :charge
      t.string :area
      t.string :day
      t.integer :sale
      t.references :prefecture
      t.references :user
      t.references :category
      t.references :brand
      t.timestamps
    end
  end
end
