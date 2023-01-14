class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :description

      t.timestamps
    end

    add_index :categories, :description, unique: true
  end
end
