class CreateAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :adresses do |t|
      t.string :name, null: false
      t.string :line_1, null: false
      t.string :line_2
      t.string :country, null: false
      t.string :city, null: false
      t.string :zip, null: false
      t.string :long
      t.string :lat

      t.timestamps
    end
  end
end
