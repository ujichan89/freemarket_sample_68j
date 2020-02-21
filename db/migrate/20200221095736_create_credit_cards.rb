class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.integer :number
      t.string :owner
      t.integer	:expiration
      t.string :type
      t.integer	:security
      t.references :user
      t.timestamps
    end
  end
end
