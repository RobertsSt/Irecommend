# == Schema Information
#
# Table name: likes
#
#  id         :bigint(8)        not null, primary key
#  post_id    :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
end
