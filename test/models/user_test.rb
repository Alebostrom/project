require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "Should enter first name" do
    user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end
  
  test "Should enter last name" do
    user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end
  
  test "Should enter profile name" do
    user = User.new
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  
  test "a user should have a unique profile name" do
    user = User.new
    user.profile_name = users(:alexander).profile_name
    
    assert !user.save
    assert !user.errors[:profile_name].empty?
  end
  
  test "user should have profuile name without space" do
    user = User.new
    user.profile_name = "My profile with space"
    
    assert !user.save
    assert !user.errors[:profile_name].empty?
    assert user.errors[:profile_name].include?("profile name must be formated corrctly.")
  end
  
end
