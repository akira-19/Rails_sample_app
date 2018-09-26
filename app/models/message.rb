class Message < ApplicationRecord
	belongs_to :sender, class_name: "User"
	belongs_to :receiver, class_name: "User"
	belongs_to :room
	validates :content, presence:true, length: {maximum:200}
	validates :sender_id, presence:true
	validates :receiver_id, presence:true
	validates :room_id, presence: true
	validate :message_belongs_to_room

	private
		def message_belongs_to_room
			room = Room.find_by(id: self.room_id)
			unless room && ((room.user1 == self.sender_id) || (room.user1 == self.receiver_id))
				errors.add(:room_id, "your message is sent in a diffrent room")
			end

			unless room && ((room.user2 == self.sender_id) || (room.user2 == self.receiver_id))
				errors.add(:room_id, "your message is sent in a diffrent room")
			end
		end

end
