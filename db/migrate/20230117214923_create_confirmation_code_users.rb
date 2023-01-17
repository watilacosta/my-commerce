class CreateConfirmationCodeUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :confirmation_code_users do |t|
      t.references :user, null: false, foreign_key: true
      t.string :code

      t.timestamps
    end
  end
end
