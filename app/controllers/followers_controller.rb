class FollowersController < ApplicationController
  def index
    @users = Tweet.all
    @followers = Following.where(following_user: current_user)
    @followings = Following.where(follower_user: current_user)
  end

  def create

  end
end
