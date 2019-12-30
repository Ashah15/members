module SessionsHelper
	def log_in(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end


  # Returns the user corresponding to the remember token cookie.
  def current_user
      @current_user = User.find_by(id: cookies.signed[:user_id])
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end


  def log_out
    current_user = nil
    cookies.delete(:remember_token)

  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end


end
