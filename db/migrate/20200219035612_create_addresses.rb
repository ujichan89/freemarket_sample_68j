class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name, null: false
      t.string :first_name, null: false
      t.string :family_furigana, null: false
      t.string :first_furigana, null: false
      t.integer :number, null: false
      t.string :prefecture, null: false
      t.string :municipality, null: false
      t.string :street, null: false
      t.string :building
      t.string :phone_number
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
