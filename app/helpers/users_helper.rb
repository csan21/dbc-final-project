module UsersHelper
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  def set_session(user)
    session[:user_id] = user.id
  end

  def delete_session
    session.delete(:user_id)
    @current_user = nil
  end
end
