class CreateProductOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :product_options do |t|
      t.string :name
      t.string :slug

      t.timestamps
    end
  end
end
