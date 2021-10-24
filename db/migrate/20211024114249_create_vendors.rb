class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.string :image
      t.string :cover
      t.boolean :online
      t.string :legal_name
      t.date :incorporation_date
      t.date :registration_date
      t.string :registration_address
      t.string :registration_number
      t.boolean :verified
      t.boolean :activated

      t.timestamps
    end
  end
end
