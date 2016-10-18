class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_current_user

  def user_sign_in(user)
    @current_user = user
    session[:current_user_id] = @current_user.id
  end

  def set_current_user
    @current_user = User.find(session[:current_user_id]) if session.has_key?(:current_user_id)
  end

  def current_user
    @current_user ||= User.find(session[:current_user_id]) if session.has_key?(:current_user_id)
  end

  def user_signed_in?
    @current_user.present?
  end
end
