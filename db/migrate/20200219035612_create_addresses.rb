class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :family_name
      t.string :first_name
      t.string :family_furigana
      t.string :first_furigana
      t.integer :number
      t.string :prefecture
      t.string :municipality
      t.string :street
      t.string :building
      t.integer :phone_number
      t.references :user

      t.timestamps
    end
  end
end
