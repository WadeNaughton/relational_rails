class CreateLibrary < ActiveRecord::Migration[5.2]
  def change
    create_table :libraries do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.boolean :open
      t.integer :max_capacity
      t.string :name
      t.string :city
    end
  end
end
