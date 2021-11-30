class CreateAuthor < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.timestamp :created_at
      t.timestamp :updated_at
      t.boolean :award_winning
      t.integer :age
      t.string :name
    end
  end
end
