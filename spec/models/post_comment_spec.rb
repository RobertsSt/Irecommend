require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validation tests" do
    before do
      @current_user = User.new(id: 1, name: 'current', username: 'user', email: 'current@user.com', password: 'password')
      @current_user.save
      @category = Category.new(id: 1, name: "Izklaide")
      @category.save
      @user_post = Post.new(id: 1, post: "Post", user_id: @current_user.id, category_id: @category.id)
      @user_post.save
    end

    it "validates length of post" do
      name = "421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 421 sim"
      post = Post.new(post: name, user_id: @current_user.id, category_id: @category.id)
      failed = post.save
      expect(failed).to eq(false)
    end

    it "validates category presence" do
      post = Post.new(post: "Posting", user_id: @current_user.id)
      failed = post.save
      expect(failed).to eq(false)
    end

    it "validates user id presence" do
      post = Post.new(post: "Posting", category_id: @category.id)
      failed = post.save
      expect(failed).to eq(false)
    end

    it "validates length of comment" do
      content = "211 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 211 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 211 simbolu garš teksts, kas neiekļaujas posta paredzētajam garumam, 211 s"
      comment = Comment.new(post_id: @user_post.id, user_id: @current_user.id, content: content)
      failed = comment.save
      expect(failed).to eq(false)
    end
  end
end
