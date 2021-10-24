class CreateBrands < ActiveRecord::Migration[6.1]
  def change
    create_table :brands do |t|
      t.string :name
      t.string :slug
      t.string :image
      t.boolean :activated

      t.timestamps
    end
  end
end
