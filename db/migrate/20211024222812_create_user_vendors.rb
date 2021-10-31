class CreateUserVendors < ActiveRecord::Migration[6.1]
  def change
    create_table :user_vendors do |t|
      t.references :user, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
