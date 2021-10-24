class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.string :image
      t.boolean :activated

      t.timestamps
    end
  end
end
