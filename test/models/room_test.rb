require 'test_helper'

class RoomTest < ActiveSupport::TestCase

	def setup
		@room = Room.new(user1: 5, user2: 3)
	end

  test "should be valid" do
  	assert @room.valid?
  end

	test "room should be unique users" do
	 duplicate_room = Room.new(user1: 3, user2: 5)
	 @room.save
	 assert_not duplicate_room.valid?
	end
end
