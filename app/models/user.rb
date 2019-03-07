class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :followings_as_follower, class_name: "Following", foreign_key: "follower_user_id", dependent: :destroy
  has_many :followings_as_following, class_name: "Following", foreign_key: "following_user_id", dependent: :destroy

  def follows? (user)
    self.followings_as_follower.any? {|following| following.following_user_id == user.id}
  end

  def whom_to_follow(limit = 3)
    User.order("random()").where("users.id != (?)", id).joins(
      "LEFT OUTER JOIN followings ON followings.following_user_id = users.id AND followings.follower_user_id = #{id}"
    ).where(
      followings: {follower_user_id: nil}
    ).limit(limit)
  end
end
