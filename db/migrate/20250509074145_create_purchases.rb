class CreatePurchases < ActiveRecord::Migration[8.0]
  def change
    create_table :purchases do |t|
      t.references :asset, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
