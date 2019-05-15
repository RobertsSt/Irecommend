require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
    @current_user.save
    @category = Category.new(id: 1, name: "Izklaide")
    @category.save
  end

  it '#show' do

  end

  it '#index' do

  end

  it 'post should save successfully' do
    post = Post.new(post: "Posting", user_id: @current_user.id, category_id: @category.id)
    successful = post.save
    expect(successful).to eq(true)
  end
  it 'post should update successfully' do
    post = Post.new(post: "Posting", user_id: @current_user.id, category_id: @category.id)
    successful = post.save
    expect(successful).to eq(true)
    post.update(post: "Updated post")
    expect(post.post).to eq("Updated post")

  end
  it 'post should delete successfully' do
    post = Post.new(id: 1, post: "Posting", user_id: @current_user.id, category_id: @category.id)
    successful = post.save
    expect(successful).to eq(true)
    post.destroy
    unfound = Post.find_by(id: 1)
    expect(unfound).to eq(nil)
  end
end
