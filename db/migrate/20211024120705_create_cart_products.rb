class CreateCartProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_products do |t|
      t.integer :quantity, null: false
      t.decimal :total, null: false
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
