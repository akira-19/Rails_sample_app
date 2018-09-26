class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #
  def account_activation(user)
		@user = user
    mail to: user.email, subject: "Account activation"
  end

  def password_reset(user)
		@user = user
    mail to: user.email, subject: "Password reset"
  end

	def get_followed(following_user, followed_user)
		@following_user = following_user
		@followed_user = followed_user
		mail to: followed_user.email, subject: "You got followed"
	end
end
