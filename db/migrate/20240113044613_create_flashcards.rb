class CreateFlashcards < ActiveRecord::Migration[7.0]
  def change
    create_table :flashcards do |t|
      t.references :user, null: false, foreign_key: true
      t.string :question, null: false
      t.text :response, null: false
      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end
