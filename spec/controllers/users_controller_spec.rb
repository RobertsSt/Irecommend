require 'rails_helper'
require 'devise'
RSpec.describe UsersController, type: :controller do
  before do
    @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
    @current_user.save
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

  it 'successfully log in with properly filled username end password' do
    visit new_user_session_path()
    fill_in "Epasts / Lietotājvārds", with: @current_user.username
    fill_in "Parole", with: @current_user.password
    click_button "Ielogoties"
    expect(page).to_not have_content("Ielogoties")
    expect(page).to have_content("Esi veiksmīgi ielogojies")
    expect(page.has_link?('', href: destroy_user_session_path)).to be true
  end
end
