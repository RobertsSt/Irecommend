class UserTweetsController < ApplicationController
  def index
    @tweets = Tweet.where(user_id: current_user ).order("created_at DESC")
    @tweet = Tweet.new
    @followers = Following.where(following_user: current_user)
    @followings = Following.where(follower_user: current_user)
  end
end
