class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.decimal :amount, precision: 6, scale: 2
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
