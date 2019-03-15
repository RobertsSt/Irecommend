class CommentsController < ApplicationController
  before_action :set_tweet

  def create
    @comment = @tweet.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      respond_to do |format|
        format.html { redirect_to tweet_path(@tweet) }
        format.js
      end
    else
      flash[:alert] = "Check the comment form, something went horribly wrong."
      render root_path
    end
  end

  def destroy
    @comment = @tweet.comments.find(params[:id])

    if @comment.user_id == current_user.id
     @comment.delete
     respond_to do |format|
       format.html { redirect_to root_path }
       format.js
     end
     redirect_to tweet_path(@tweet)
   end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end
