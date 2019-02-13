class Following < ApplicationRecord
  belongs_to :follower_user, class_name: 'User'
  belongs_to :following_user, class_name: 'User'

  validates_exclusion_of :following_user, in: -> (record) { [record.follower_user] }, message: 'can not be followed by himself'
end
