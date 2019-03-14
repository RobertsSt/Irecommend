class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  validates_length_of :tweet, maximum: 420, minimum: 1
  has_attached_file :image
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :comments, dependent: :destroy
end
