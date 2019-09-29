require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should add following relation" do
    active_user = User.first
    passive_user = User.second
    active_user.unfollow(passive_user) if active_user.following.include?(passive_user)
    active_user.follow passive_user.id
    assert (active_user.following.include?(passive_user))
  end
end
