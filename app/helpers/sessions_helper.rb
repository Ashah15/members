module SessionsHelper
  def log_in(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
    @current_user = user
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
    @current_user.forget
    cookies.delete(:user_id)
    @current_user = nil
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user == current_user
  end


end
