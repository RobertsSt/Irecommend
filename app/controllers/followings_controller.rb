class FollowingsController < ApplicationController
  def index
    @users = Tweet.all
    @followings = Following.where(follower_user: current_user)
    @followers = Following.where(following_user: current_user)
  end

  def create
    following = Following.new
    following.follower_user_id = current_user.id
    following.following_user_id = params[:following_user_id]
    following.save
    redirect_back fallback_location: root_path
  end

  def destroy
    following = Following.find_by(follower_user: current_user, following_user_id: (params[:id]))
    following.destroy
    redirect_back fallback_location: root_path
  end
end
