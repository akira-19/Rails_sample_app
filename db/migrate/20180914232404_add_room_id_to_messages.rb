class AddRoomIdToMessages < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :room_id, :integer
		add_index :messages, :room_id, unique: true
  end
		
end
