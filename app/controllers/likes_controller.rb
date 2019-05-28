class LikesController < ApplicationController
  before_action :set_post

  def index
    @likes = Like.where(post_id: @post.id)
  end

  def create
    @like = Like.new
    if Like.find_by(post_id: @post.id, user_id: current_user.id) #dubult klikšķa kļūdas labojums
      redirect_to root_path
    else
      @like.post_id = @post.id
      @like.user_id = current_user.id

      if @like.save
        respond_to do |format|
          format.html { redirect_back fallback_location: root_path }
          format.js
        end
      else
        flash[:alert] = "Nepareizi uzspiedi like"
        redirect_back fallback_location: root_path
      end
    end
  end

  def destroy
    @like = @post.likes.find(params[:id])
    if @like
      if @like.user_id == current_user.id
       @like.delete
       respond_to do |format|
         format.html { redirect_back fallback_location: root_path }
         format.js
       end
     else
       redirect_back fallback_location: root_path
     end
   end
  end

  private


  def set_post
    @post = Post.find(params[:post_id])
  end
end
