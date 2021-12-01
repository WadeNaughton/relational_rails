class CreateLibrary < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :city
      t.boolean :open
      t.integer :max_capacity
      t.timestamps
    end
  end
end
