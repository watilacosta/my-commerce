class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email, null: false
      t.string :password_digest, null: false
      t.integer :profile, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
