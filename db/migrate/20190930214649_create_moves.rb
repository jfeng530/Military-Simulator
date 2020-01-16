class CreateMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :moves do |t|
      t.string :name
      t.integer :damage
      t.string :info
      t.integer :element_id
    end
  end
end
