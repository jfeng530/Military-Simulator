class AddStatusToBattles < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :unit_status, :string
    add_column :battles, :enemy_status, :string
  end
end
