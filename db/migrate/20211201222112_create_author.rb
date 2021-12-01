class CreateAuthor < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.boolean :award_winning
      t.integer :age
      t.string :name
      t.timestamps
    end
  end
end
