class Room < ApplicationRecord
	has_many :messages, dependent: :destroy
	validates :user1, presence: true
	validates :user2, presence: true
	validates :user1, uniqueness: { scope: :user2}
	before_save :user_order

	private
		def user_order
			if self.user1 > self.user2
				self.user1, self.user2 = user2, user1
			end
		end

end
