# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#  username               :string
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :integer
#  avatar_updated_at      :datetime
#  bio                    :text
#  admin                  :boolean          default(FALSE)
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, authentication_keys: [:login]

  has_many :posts, dependent: :destroy
  has_many :followings_as_follower, class_name: "Following", foreign_key: "follower_user_id", dependent: :destroy
  has_many :followings_as_following, class_name: "Following", foreign_key: "following_user_id", dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates_length_of :bio, maximum: 110
  has_attached_file :avatar, styles: { medium: '152x152#' }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates :email, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true #username cant be email (@)
  validates_format_of :email,:with => Devise::email_regexp #email must have "@"
  validates_length_of :username, maximum: 20, minimum: 2
  validates_length_of :email, maximum: 40, minimum: 5
  validates_length_of :name, maximum: 20, minimum: 2
  validates_length_of :password, maximum: 20

  attr_writer :login

  after_validation :set_user_role

  def set_user_role
    if self.admin != true
      self.admin = false
    end
  end

  def login
    @login || self.username || self.email
  end


  def follows? (user)
    self.followings_as_follower.any? {|following| following.following_user_id == user.id}
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
        where(username: conditions[:username]).first
      end
    end
  end


  def whom_to_follow(limit = 3)
    if followings_as_follower.count == 0 # Ja nav sekotāju tad rāda trīs nejauši izvēlētus lietotājus
      User.order("random()").where("users.id != (?)", id).joins(
        "LEFT OUTER JOIN followings ON followings.following_user_id = users.id AND followings.follower_user_id = #{id}"
      ).where(
        followings: {follower_user_id: nil}
      ).limit(limit)
    else
      ids = []
      followings_as_follower.each do |follower|
        ids << follower.following_user.followings_as_follower.pluck(:following_user_id)
      end
      User.order("random()").where(
        id: ids.flatten - [id] - followings_as_follower.pluck(:following_user_id)
      ).limit(limit)
    end
  end
end
