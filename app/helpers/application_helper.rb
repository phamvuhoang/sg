module ApplicationHelper

  def user_signed_in
  end

  def current_user
    current_user= User.find(session[:user_id]) if session.has_key?(:user_id)
  end
end
