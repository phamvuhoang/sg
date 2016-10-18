class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
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
    params.require(:user).permit(:name, :password, :email)
  end
end
