class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.boolean :online, default: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :phone_1, null: false
      t.string :phone_2
      t.string :image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
