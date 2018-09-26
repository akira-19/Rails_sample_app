require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
	test "account_activation" do
		user = users(:michael)
		user.reset_token = User.new_token
		user.activation_token = User.new_token
		mail = UserMailer.account_activation(user)
		assert_equal "Account activation", mail.subject
		assert_equal [user.email], mail.to
		assert_equal ["noreply@example.com"], mail.from
		assert_match user.name,               mail.body.encoded
		assert_match user.activation_token,   mail.body.encoded
		assert_match CGI.escape(user.email),  mail.body.encoded
	end

	test "a user follows another user" do
		@user1 = users(:archer)
		@user2 = users(:lana)
		@user1.user_followed(@user2)
		mail = UserMailer.get_followed(@user1, @user2)
		assert_equal "You got followed", mail.subject
		assert_equal [@user2.email], mail.to
		assert_equal ["noreply@example.com"], mail.from
	end


end
