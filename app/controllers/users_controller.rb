class UsersController < ApplicationController
  before_action :load_user, :load_followers, :load_followings, :load_following

  def show
    @tweets = Tweet.where(user_id: @user ).order("created_at DESC")
    @tweet = Tweet.new
  end

  def followings
  end

  def followers
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to root_path
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def load_followers
    @followers = Following.where(following_user: @user )
  end

  def load_followings
    @followings = Following.where(follower_user: @user )
  end

  def load_following
    @following = Following.find_by( follower_user_id: current_user.id, following_user_id: @user )
  end
end
