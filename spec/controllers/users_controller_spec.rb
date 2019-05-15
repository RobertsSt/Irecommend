require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
    @current_user.save
  end

  it 'GET #show returns a success response' do
    get :show, params: { id: @current_user.to_param }
    expect(response).to be_success
  end

  it 'should update user successfully' do
    @current_user.update(name: 'nameUpdated')
    expect(@current_user.name).to eq('nameUpdated')
    @current_user.update(username: 'usernameUpdated')
    expect(@current_user.username).to eq('usernameUpdated')
    @current_user.update(email: 'updatecurrent@user.com')
    expect(@current_user.email).to eq('updatecurrent@user.com')
    @current_user.update(password: 'updatePassword')
    expect(@current_user.password).to eq('updatePassword')
  end

  it "user should register successfully" do
    user = User.new(name: 'name', username: 'username', email: 'email@email.com', password: 'password')
    successful = user.save
    expect(successful).to eq(true)
  end

  it 'should delete user successfully' do
    user = User.new(id: 2, name: 'name', username: 'username', email: 'email@email.com', password: 'password')
    successful = user.save
    expect(successful).to eq(true)
    user.destroy
    unfound = User.find_by(id: 2)
    expect(unfound).to eq(nil)
  end

  it 'login' do

  end

  it 'followings' do

  end

  it 'followers' do
    
  end
end
