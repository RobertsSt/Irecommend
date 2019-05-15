require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
    @current_user.save
    @category = Category.new(id: 1, name: "Izklaide")
    @category.save
    @user_post = Post.new(id: 1, post: "Post", user_id: @current_user.id, category_id: @category.id)
    @user_post.save
  end

  it "comment should save successfully" do
    comment = Comment.new(post_id: @user_post.id, user_id: @current_user.id, content: "hello friend")
    successful = comment.save
    expect(successful).to eq(true)
  end

  it 'comment should delete successfully' do
    comment = Comment.new(id: 1, post_id: @user_post.id, user_id: @current_user.id, content: "hello friend")
    successful = comment.save
    expect(successful).to eq(true)
    comment.destroy
    unfound = Comment.find_by(id: 1)
    expect(unfound).to eq(nil)
  end
end
