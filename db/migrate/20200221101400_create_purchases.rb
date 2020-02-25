class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.datetime :date
      t.references :user
      t.references :item
      t.timestamps
    end
  end
end
