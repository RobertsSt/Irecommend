require 'rails_helper'

RSpec.describe FollowingsController, type: :controller do
  before do
    @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
    @current_user.save
    @follower_user = User.new(id: 2, name: 'Iam', username: 'follower', email: 'follower@user.com', password: 'password')
    @follower_user.save
  end
  it "should create new following successfully" do
    following = Following.new
    following.follower_user_id = @follower_user.id
    following.following_user_id = @current_user.id
    successful = following.save
    expect(successful).to eq(true)
  end
  it "should delete following successfully" do
    following = Following.new
    following.id = 1
    following.follower_user_id = @follower_user.id
    following.following_user_id = @current_user.id
    successful = following.save
    following.destroy
    unfound = Following.find_by(id: 2)
    expect(successful).to eq(true)
  end
end
