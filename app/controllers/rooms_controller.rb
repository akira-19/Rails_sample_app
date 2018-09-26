class RoomsController < ApplicationController


	def index
		@rooms = Room.where("user1 = :user1 OR user2 = :user2", user1: current_user.id, user2: current_user.id)
		@room = Room.new

	end

  def create
		if partner = User.find_by(id_name: params[:room][:user2])
			@room = Room.new(user1: current_user.id, user2: partner.id)
			if @room.save
				redirect_to @room
			else
				flash[:info] = "Failed to make a room"
				render_index
			end
		else
			flash[:info] = "Can't find the user"
			render_index
		end

  end


  def show
		@room = Room.find_by(id: params[:id])
		@message = Message.new
		@messages = Message.where(room_id: params[:id])
		if @room and (@room.user1 == current_user.id)
			@partner = User.find_by(id: @room.user2)
		elsif @room and (@room.user2 == current_user.id)
			@partner = User.find_by(id: @room.user1)
		else
			flash[:error] = "Can't find the user"
			render_index
		end
  end

	private
		def room_params
		end

		def render_index
			@rooms = Room.where("user1 = :user1 OR user2 = :user2", user1: current_user.id, user2: current_user.id)
			@room = Room.new
			render 'index'
		end


end
