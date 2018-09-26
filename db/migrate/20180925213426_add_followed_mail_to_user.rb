class AddFollowedMailToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :followed_mail, :integer, default: 0
  end
end
