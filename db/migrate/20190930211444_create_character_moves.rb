class CreateCharacterMoves < ActiveRecord::Migration[5.2]
  def change
    create_table :character_moves do |t|
      t.integer :character_id
      t.integer :move_id
    end 
  end
end
