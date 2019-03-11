class Tweet < ApplicationRecord
  belongs_to :user, optional: true
  validates_length_of :tweet, maximum: 420, minimum: 1
end
