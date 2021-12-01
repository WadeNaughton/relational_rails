class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.boolean :hardcover
      t.integer :pages
      t.string :name
      t.string :genre
      t.references :author, foreign_key: true
      t.timestamps
    end
  end
end
