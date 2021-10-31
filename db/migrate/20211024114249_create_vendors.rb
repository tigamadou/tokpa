class CreateVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :vendors do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :image
      t.string :cover
      t.boolean :online, default: false
      t.string :legal_name, null: false
      t.date :incorporation_date, null: false
      t.date :registration_date, null: false
      t.string :registration_address, null: false
      t.string :registration_number, null: false
      t.boolean :verified, default: false
      t.boolean :activated

      t.timestamps
    end
  end
end
