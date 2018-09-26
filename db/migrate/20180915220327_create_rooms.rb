class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :user1, null:false
      t.integer :user2, null: false

      t.timestamps
    end
		add_index :rooms, [:user1, :user2], unique:true
  end
end
