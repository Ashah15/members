class UsersController < ApplicationController
	def new
		@user = User.new		
	end

	def create
	  @user = User.new(user_params)
		if @user.save
      log_in @user
		  redirect_to root_url
		else
		 render 'new'
		end
	end

	def show
    @user = User.find(params[:id])
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
