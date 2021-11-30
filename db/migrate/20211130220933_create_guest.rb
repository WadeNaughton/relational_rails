class CreateGuest < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.belongs_to :library, index: true, foreign_key: true
      t.timestamp :created_at
      t.timestamp :updated_at
      t.boolean :new
      t.integer :age
      t.string :name
    end
  end
end
