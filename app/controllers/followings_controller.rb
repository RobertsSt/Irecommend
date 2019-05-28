class FollowingsController < ApplicationController
  def create
    if Following.find_by(follower_user_id: current_user.id, following_user_id: params[:following_user_id]) #dubult klikšķa kļūdas labojums
      redirect_back fallback_location: root_path
    else
      following = Following.new
      following.follower_user_id = current_user.id
      following.following_user_id = params[:following_user_id]
      following.save
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    following = Following.find_by(follower_user: current_user, following_user_id: (params[:id]))
    if following
      following.destroy
    end
    redirect_back fallback_location: root_path
  end
end
