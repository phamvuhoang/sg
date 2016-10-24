class FriendshipsController < ApplicationController

  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

    if @friendship.save
      flash[:notice] = "Friend added"
      redirect_to users_path
    else
      flash[:notice] = "Unable to add friend"
      redirect_to users_path
    end

  end

  def destroy
    @friendship = current_user.friendships.where(:friend_id => params[:id])
    @friendship.destroy_all

    flash[:notice] = "Friendship removed"
    redirect_to users_path
  end

end
