class PostsController < ApplicationController
	before_action :logged_in_user, only: [:new, :create, :destroy]


	  def new
		  @post = current_user.post.new
	  end

    def create
        @post = current_user.post.build(post_params)
        if @post.save
        	  flash.now[:success] = 'Post created!'
            redirect_to posts_path
        else
            render :new
        end

    end

    def index
    		@user = current_user
        @posts = Post.all
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

 

    def post_params
        params.require(:post).permit(:title, :body, :user_id)
    end

end
