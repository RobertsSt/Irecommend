class FollowersController < ApplicationController
  def index
    @users = Tweet.all
    @followers = Following.where(following_user: current_user)
  end
end
