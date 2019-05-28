class UsersController < ApplicationController
  before_action :logged_in?
  before_action :load_user, :load_followers, :load_followings, :load_following

  def show
    @allposts = Post.where(user_id: @user ).order("created_at DESC")
    @posts = @allposts.page(params[:page]).per(20)
    @post = Post.new
    @page = params[:page].to_i
    if @page == 0
      @page = 1
    end
  end

  def edit
    if @user != current_user
      redirect_to root_path, alert: 'Nav piekļuve'
    end
    @edit = "edit" #if @edit ir definēts tad nomainās background
  end

  def followings
  end

  def followers
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path, notice: 'Lietotājs tika izdzēsts.' }
      format.json { head :no_content }
    end
  end

  def update
    if @user == current_user
      if @user.update(user_params)
        redirect_to root_path, notice: "Tavs profils tika veiksmīgi rediģēts."
      else
        redirect_to root_path, alert: "Lietotāja apraksts neatbilst formātam (maksimālais simbolu skaits ir 110)"
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
