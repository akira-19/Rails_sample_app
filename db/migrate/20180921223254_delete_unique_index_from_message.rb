class DeleteUniqueIndexFromMessage < ActiveRecord::Migration[5.1]
  def change
		remove_index :messages, :room_id
    add_index :messages, :room_id
  end
end
