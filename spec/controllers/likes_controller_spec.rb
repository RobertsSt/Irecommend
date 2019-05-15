require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
    @current_user.save
    @category = Category.new(id: 1, name: "Izklaide")
    @category.save
    @user_post = Post.new(id: 1, post: "Post", user_id: @current_user.id, category_id: @category.id)
    @user_post.save
  end

  it "create like successfully" do
    like = Like.new(post_id: @user_post.id, user_id: @current_user.id)
    successful = like.save
    expect(successful).to eq(true)
  end

  it "delete like successfully" do
    like = Like.new(id: 1, post_id: @user_post.id, user_id: @current_user.id)
    successful = like.save
    expect(successful).to eq(true)
    like.destroy
    unfound = Like.find_by(id: 1)
    expect(unfound).to eq(nil)
  end
end
