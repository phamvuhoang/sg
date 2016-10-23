class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_user
  helper_method :current_user

  def user_sign_in(user)
    @current_user = user
    session[:user_id] = @current_user.id
  end

  def set_current_user
    @current_user = User.find(session[:user_id]) if session.has_key?(:user_id)
  end

  def current_user
    return @current_user if @current_user
    if (session[:user_id])
      @current_user = User.find(session[:user_id])
    end
    #@current_user ||= User.find(session[:user_id]) if session.has_key?(:user_id)
  end


=begin  def user_signed_in?
    @current_user.present?
  end
=end
end
