class UserTweetsController < ApplicationController
  def index
    @alltweets = Tweet.where(user_id: current_user ).order("created_at DESC")
    @tweets = @alltweets.page(params[:page]).per(20)
    @tweet = Tweet.new
    @followers = Following.where(following_user: current_user)
    @followings = Following.where(follower_user: current_user)
    @page = params[:page].to_i
  end
end
