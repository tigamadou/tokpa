class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :line_1
      t.string :line_2
      t.string :country
      t.string :city
      t.string :zip
      t.string :long
      t.string :lat

      t.timestamps
    end
  end
end
