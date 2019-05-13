# == Schema Information
#
# Table name: followings
#
#  id                :bigint(8)        not null, primary key
#  follower_user_id  :integer
#  following_user_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Following < ApplicationRecord
  belongs_to :follower_user, class_name: 'User'
  belongs_to :following_user, class_name: 'User'
end
