require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)
  
  test "that creating a friendship work" do
    assert_nothing_raised do
     UserFriendship.create user: users(:alexis), friend: users(:mello)
   end
  end
end
