class MicropostsController < ApplicationController
before_action :logged_in_user, only: [:create, :destroy]
before_action :correct_user,   only: :destroy

	def create
		@micropost = current_user.microposts.build(micropost_params)
		@micropost.in_reply_to = get_in_reply_to
		if @micropost.in_reply_to == @micropost.user_id
			flash[:info] = "You can't reply to yourself"
			redirect_to root_url
		else
			if @micropost.save
				flash[:success] = "Micropost created!"
				redirect_to root_url
			else
				@feed_items = []
				render 'static_pages/home'
			end
		end
	end

	def destroy
		@micropost.destroy
		flash[:success] = "Micropost deleted"
		redirect_to request.referrer || root_url
	end

	private

		def micropost_params
			params.require(:micropost).permit(:content, :picture)
		end

		def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
		end

		def get_in_reply_to
			content = @micropost.content
			reply_user_name = ""
			if content && (content[0] == "@") #when content is not nil
				i = 1
				while content[i] != " "
					reply_user_name += content[i]
					i += 1
				end
				reply_user = User.find_by(id_name: reply_user_name)
				if reply_user
					return reply_user.id
				end
				return 0
			else
				return 0
			end
		end

end
