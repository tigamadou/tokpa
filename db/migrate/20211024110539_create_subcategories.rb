class CreateSubcategories < ActiveRecord::Migration[6.1]
  def change
    create_table :subcategories do |t|
      t.string :name, null: false
      t.string :slug, null: false
      t.boolean :activated, default: false
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
