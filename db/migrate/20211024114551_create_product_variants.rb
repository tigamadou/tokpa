class CreateProductVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variants do |t|
      t.decimal :price, null: false
      t.string :sku, null: false
      t.string :image
      t.integer :quantity, null: false
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
