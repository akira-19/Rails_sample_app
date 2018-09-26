class MessagesController < ApplicationController

  def new

  end

  def create
		@message = Message.new(msg_params)
		@message.attributes = {sender_id: params[:sender_id],
														receiver_id: params[:receiver_id],
														room_id: params[:room_id]}
		if @message.save
			redirect_to "/rooms/#{@message.room_id}"
		else
			flash[:error] = "fail sending a message."
			redirect_to "/rooms/#{@message.room_id}"
			#render "rooms/#{@message.room_id}"
		end
  end

	private
		def msg_params
			params.require(:message).permit(:content)
		end



end
