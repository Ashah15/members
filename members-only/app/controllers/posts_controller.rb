class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create]


	def new
		@post = Post.new
	end



	private

    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end


    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
