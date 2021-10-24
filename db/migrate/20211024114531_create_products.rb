class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.text :description, null: false
      t.boolean :active, default: false
      t.boolean :available, default: false
      t.boolean :validated, default: false
      t.references :subcategory, null: false, foreign_key: true
      t.references :brand, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
