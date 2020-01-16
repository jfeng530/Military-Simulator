class CreateCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :info
      t.integer :user_id
      t.integer :element_id
    end 
  end
end
