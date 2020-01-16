class CreateElements < ActiveRecord::Migration[5.2]
  def change
    create_table :elements do |t|
      t.string :name
      t.integer :hp
      t.string :info
      t.string :sprite
    end
  end
end
