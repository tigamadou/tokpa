class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.boolean :active
      t.boolean :available
      t.boolean :validated
      t.references :subcategory, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
