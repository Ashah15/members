class SessionsController < ApplicationController
  def new
  end
  
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
    	log_in user
    	redirect_to posts_path
      flash[:success] = "Succesfully Logged In"
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render 'new' 
    end

  end

  def destroy
  	log_out if logged_in?
    unless logged_in?
  	  redirect_to login_path
    end
  end

end
