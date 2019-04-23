class UsersController < ApplicationController
  before_action :load_user, :load_followers, :load_followings, :load_following

  def show
    @alltweets = Tweet.where(user_id: @user ).order("created_at DESC")
    @tweets = @alltweets.page(params[:page]).per(20)
    @tweet = Tweet.new
    @page = params[:page].to_i
    if @page == 0
      @page = 1
    end
  end

  def edit
    if @user != current_user
      redirect_to root_path, alert: 'Nav piekļuve'
    end
    @edit = "edit"
  end

  def followings
  end

  def followers
  end

  def destroy
    user = User.find(username: params[:username])
    user.destroy
    redirect_to root_path
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        flash[:success] = 'Your profile has vbeen updated.'
        redirect_to profile_path(@user.username)
      else
        @user.errors.full_messages
        flash[:error] = @user.errors.full_messages
        render :edit
      end
    else
      redirect_to profile_path(@user.username)
    end
  end


  private

  def load_user
    @user = User.find_by(username: params[:username])
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

  def user_params
    params.require(:user).permit(:avatar, :bio)
  end
end
