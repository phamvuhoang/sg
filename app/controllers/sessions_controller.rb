class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user.present? and @user.authenticate(params[:password])
      user_sign_in(@user)

      redirect_to users_path, flash: {success: 'Successfully logged in'}
    else
      redirect_to new_session_path, notice: 'Email or password incorrect'
    end
  end

  def destroy
    session[:user_id] = nil

    redirect_to root_path
  end
  
end