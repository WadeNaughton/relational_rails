class CreateBook < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.belongs_to :author, index: true, foreign_key: true
      t.timestamp :created_at
      t.timestamp :updated_at
      t.boolean :hardcover
      t.integer :pages
      t.string :name
      t.string :genre
    end
  end
end
