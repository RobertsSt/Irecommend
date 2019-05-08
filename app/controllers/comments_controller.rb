class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_back fallback_location: root_path, notice: 'komentārs tika veiksmīgi izveidots.' }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user_id == current_user.id || @post.user_id == current_user.id || current_user.admin
     @comment.delete
     respond_to do |format|
       format.html { redirect_back fallback_location: root_path, notice: 'komentārs tika veiksmīgi izdzēsts.' }
       format.js
     end
     redirect_back fallback_location: root_path
   end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
