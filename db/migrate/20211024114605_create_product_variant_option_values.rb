class CreateProductVariantOptionValues < ActiveRecord::Migration[6.1]
  def change
    create_table :product_variant_option_values do |t|
      t.references :product_variant, null: false, foreign_key: true
      t.references :product_variant_option, null: false, foreign_key: true,  index: false


      t.timestamps
    end
  end
end
