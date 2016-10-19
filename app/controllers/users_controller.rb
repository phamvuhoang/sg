class UsersController < ApplicationController

  def index
    Rails.logger.info request.env["HTTP_COOKIE"]
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to users_path, notice: 'Succesfully created user account!'
    else
      render action: 'new'
    end
  end

  def new
    @user = User.new
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
