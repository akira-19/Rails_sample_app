class AddDefaultToMicroposts < ActiveRecord::Migration[5.1]
  def change
		change_column :microposts, :in_reply_to, :integer, default:0
  end
end
