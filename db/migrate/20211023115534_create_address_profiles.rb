class CreateAddressProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :address_profiles do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
