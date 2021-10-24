class AddIndexOnProductVariantValuesTable < ActiveRecord::Migration[6.1]
  def change
    add_index :product_variant_option_values, :product_variant_option_id, name: 'index_product_variant_option_values_on_product_variant_optionid'
  end
end
