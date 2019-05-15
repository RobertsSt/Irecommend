require 'rails_helper'

RSpec.describe User, type: :model do
  context "validation tests" do
    before do
      @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
      @current_user.save
    end

    it "ensures name presence" do
      user = User.new(username: 'username', email: 'email@email.com', password: 'password')
      failed = user.save
      expect(failed).to eq(false)
    end

    it "ensures username presence" do
      user = User.new(name: 'name', email: 'email@email.com', password: 'password')
      failed = user.save
      expect(failed).to eq(false)
    end

    it "ensures email presence" do
      user = User.new(name: 'name', username: 'username', password: 'password')
      failed = user.save
      expect(failed).to eq(false)
    end

    it "ensures password presence" do
      user = User.new(name: 'name', username: 'username', email: 'email@email.com')
      failed = user.save
      expect(failed).to eq(false)
    end

    it "validates length of bio" do
      bio = "132 simbolu garš teksts, kas neiekļaujas bio paredzētajam garumam, 132 simbolu garš teksts, kas neiekļaujas bio paredzētajam garumam"
      user = User.new(name: 'name', username: 'username', email: 'email@email.com', password: 'password', bio: bio)
      failed = user.save
      expect(failed).to eq(false)
      user2 = User.new(name: 'name', username: 'username', email: 'email@email.com', password: 'password', bio: "neliels teksts")
      successful = user2.save
      expect(successful).to eq(true)
    end

    it "validates username uniqueness" do
      user = User.new(name: 'current', username: 'user', email: 'current2@user.com', password: 'password')
      failed = user.save
      expect(failed).to eq(false)
    end

    it "validates email uniqueness" do
      user = User.new(name: 'current', username: 'user2', email: 'current@user.com', password: 'password')
      failed = user.save
      expect(failed).to eq(false)
    end

    it "validates length of name" do
      user = User.new(name: 'n', username: 'username', email: 'email@email.com', password: 'password')
      failed = user.save
      expect(failed).to eq(false)
      user2 = User.new(name: 'namenamenamenamenamename', username: 'username', email: 'email@email.com', password: 'password')
      failed2 = user2.save
      expect(failed2).to eq(false)
    end

    it "validates length of username" do
      user = User.new(name: 'name', username: 'u', email: 'email@email.com', password: 'password')
      failed = user.save
      expect(failed).to eq(false)
      user2 = User.new(name: 'name', username: 'usernameusernameusernameusername', email: 'email@email.com', password: 'password')
      failed2 = user2.save
      expect(failed2).to eq(false)
    end

    it "validates length of email" do
      user = User.new(name: 'name', username: 'username', email: 'e@e.', password: 'password')
      failed = user.save
      expect(failed).to eq(false)
      user2 = User.new(name: 'name', username: 'username', email: 'emailemailemailemail@emailemailemailemail.com', password: 'password')
      failed2 = user2.save
      expect(failed2).to eq(false)
    end

    it "validates length of password" do
      user = User.new(name: 'name', username: 'username', email: 'email@email.com', password: 'p')
      failed = user.save
      expect(failed).to eq(false)
      user2 = User.new(name: 'name', username: 'username', email: 'email@email.com', password: 'passwordpasswordpassword')
      failed2 = user2.save
      expect(failed2).to eq(false)
    end
  end
end
