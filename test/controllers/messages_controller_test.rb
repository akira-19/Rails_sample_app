require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

	test "A message should be posted to the partner" do
		user = users(:michael)
		partner = users(:archer)
		room = rooms(:one)
		log_in_as(user)
		get room_path(room)
		assert_no_difference 'Message.count' do
			post messages_path, params: { message: { sender_id: user.id,
																							receiver_id: partner.id,
																							content: "hello",
																							room_id: 3 } }
		end
	end


end
