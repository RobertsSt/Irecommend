require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
    @current_user.save
    @category = Category.new(id: 1, name: "Izklaide")
    @category.save
  end

  it 'visit #show' do
    visit new_user_session_path()
    fill_in "Ēpasts / Lietotājvārds", with: @current_user.username
    fill_in "Parole", with: @current_user.password
    click_button "Ielogoties"
    expect(page).to_not have_content("Ielogoties")
    expect(page).to have_content("Esi veiksmīgi ielogojies")
    post = Post.new(id: 1, post: "Posting", user_id: @current_user.id, category_id: @category.id)
    post.save
    visit posts_path(post.id)
    expect(page).to_not have_content("Esi veiksmīgi ielogojies")

  end

  it 'visit #index' do
    visit new_user_session_path()
    fill_in "Ēpasts / Lietotājvārds", with: @current_user.username
    fill_in "Parole", with: @current_user.password
    click_button "Ielogoties"
    expect(page).to_not have_content("Ielogoties")
    expect(page).to have_content("Esi veiksmīgi ielogojies")
    visit posts_path()
    expect(page).to_not have_content("Esi veiksmīgi ielogojies")
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
