class CreateGuest < ActiveRecord::Migration[5.2]
  def change
    create_table :guests do |t|
      t.string :name
      t.integer :age
      t.boolean :new
      t.references :library, foreign_key: true
      t.timestamps
    end
  end
end
