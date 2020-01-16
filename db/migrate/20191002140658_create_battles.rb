class CreateBattles < ActiveRecord::Migration[5.2]
  def change
    create_table :battles do |t|
      t.integer :unit_id
      t.integer :enemy_id
      t.integer :unit_hp
      t.integer :enemy_hp
      t.string :winner
      t.string :loser
    end
  end
end
