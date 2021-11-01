class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :reference, null: false
      t.decimal :total, null: false
      t.boolean :paid, default: false
      t.references :user, null: false, foreign_key: true
      # t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
