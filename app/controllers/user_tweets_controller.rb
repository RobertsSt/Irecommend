class UserTweetsController < ApplicationController
  def index
    @tweets = Tweet.where(user_id: current_user ).order("created_at DESC")
    @tweet = Tweet.new
  end
end
