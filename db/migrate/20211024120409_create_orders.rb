class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :reference
      t.decimal :total
      t.boolean :paid
      t.references :user, null: false, foreign_key: true
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
