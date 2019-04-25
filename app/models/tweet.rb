# == Schema Information
#
# Table name: tweets
#
#  id                 :integer          not null, primary key
#  tweet              :text
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  user_id            :integer
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  category_id        :integer
#

class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  validates_length_of :tweet, maximum: 420, minimum: 1
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :comments, dependent: :destroy
  belongs_to :category
  has_many :likes, dependent: :destroy
end
