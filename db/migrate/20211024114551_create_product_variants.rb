class CreateProductVariants < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variants do |t|
      t.decimal :price
      t.string :sku
      t.string :image
      t.integer :quantity
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
