class AddStatusValueToBattles < ActiveRecord::Migration[5.2]
  def change
    add_column :battles, :unit_status_value, :integer
    add_column :battles, :enemy_status_value, :integer
  end
end
