module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end   

  #return the current logged-in user if exist
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end 

  #return true if user if logged in
  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil 
  end
end
