require 'test_helper'

class FollowingTest < ActiveSupport::TestCase
  def test_following_is_not_valid_if_follower_user_is_the_same_as_following_user
    user = users(:one)
    following = Following.new(following_user: user, follower_user: user)
    assert_not following.valid?, "Following with follower equal to following must not be valid, but it is valid!"
    assert_equal(following.errors[:following_user], ["can not be followed by himself"], "Following must have error on following_user")
  end
end
