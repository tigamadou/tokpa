class CreateAddressVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :address_vendors do |t|
      t.references :address, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
