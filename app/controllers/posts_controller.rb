class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :logged_in?

  # GET /posts
  # GET /posts.json
  def index
    @current_category = params[:category]
    if @category = Category.find_by(id: @current_category)
      @allposts = @category.posts.order("created_at DESC")
    else
      @allposts = Post.preload("user").where(user_id: current_user.followings_as_follower.select("following_user_id")).order("created_at DESC")
    end
    @posts = @allposts.page(params[:page]).per(20)
    @post = Post.new
    @followers = Following.where(following_user: current_user)
    @followings = Following.where(follower_user: current_user)
    @categories = Category.all
    @users = User.all
    @search_id = 1
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @posts = Post.preload("user").where(user_id: current_user.followings_as_follower.select("following_user_id")).order("created_at DESC")
    @followers = Following.where(following_user: current_user)
    @followings = Following.where(follower_user: current_user)
  end


  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_back fallback_location: root_path, notice: 'Ieteikums tika veiksmīgi izveidots.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { redirect_back fallback_location: root_path, alert: 'Ieteikums neatbilst formātam (minimālais simbolu skaits - 1, maksimālais simbolu skaits - 420)' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Ieteikums tika veiksmīgi rediģēts.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { redirect_to @post, alert: 'Ieteikums neatbilst formātam (minimālais simbolu skaits - 1, maksimālais simbolu skaits - 420)' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Ieteikums tika veiksmīgi izdzēsts.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:image, :post, :category_id)
    end
end
