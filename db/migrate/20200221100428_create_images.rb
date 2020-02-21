class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.text :picture
      t.references :item
      t.timestamps
    end
  end
end
