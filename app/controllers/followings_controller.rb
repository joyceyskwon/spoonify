class FollowingsController < ApplicationController

  def create
    @user = User.find(params[:followed_id])
    current_user.follow!(@user)
    flash[:notice] = "#{@user.username.capitalize} followed!"
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:followed_id])
    current_user.unfollow!(@user)
    return redirect_to @user, flash: {notice: 'Unfollowed!'}
  end

end # end of FollowingsController
