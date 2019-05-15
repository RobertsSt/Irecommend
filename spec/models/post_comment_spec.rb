require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validation tests" do
    before do
      @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password').save
      @category = Category.new(id: 1, name: "Izklaide").save
      @user_post = Post.new(id: 1, post: "Post", user_id: @current_user, category_id: @category).save
    end

    it 'post should save successfully' do
      post = Post.new(post: "Posting", user_id: @current_user, category_id: @category)
      successful = post.save
      expect(successful).to eq(true)
    end

    it "validates length of post" do
      name = "421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 sim"
      post = Post.new(post: name, user_id: @current_user, category_id: @category)
      failed = post.save
      expect(failed).to eq(false)
    end

    it "validates category presence" do
      post = Post.new(post: "Posting", user_id: @current_user)
      failed = post.save
      expect(failed).to eq(false)
    end

    it "validates user id presence" do
      post = Post.new(post: "Posting", category_id: @category)
      failed = post.save
      expect(failed).to eq(false)
    end

    it "comment should save successfully" do
      comment = Comment.new(post_id: @user_post, user_id: @current_user, content: "hello friend")
      successful = comment.save
      expect(successful).to eq(true)
    end

    it "validates length of comment" do
      content = "211 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 211 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 211 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 211 s"
      comment = Comment.new(post_id: @user_post, user_id: @current_user, content: content)
      failed = comment.save
      expect(failed).to eq(false)
    end
    it "create like successfully" do
      like = Like.new(post_id: @user_post, user_id: @current_user)
      successful = like.save
      expect(successful).to eq(true)
    end
  end
end
