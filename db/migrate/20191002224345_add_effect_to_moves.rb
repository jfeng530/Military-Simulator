class AddEffectToMoves < ActiveRecord::Migration[5.2]
  def change
    add_column :moves, :effect, :string
  end
end
