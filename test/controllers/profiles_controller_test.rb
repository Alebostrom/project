require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show, id: users(:alexander).profile_name
    assert_response :success
    assert_template 'profiles/show'
  end
  
  test "render 404 when profile os not found" do
    get :show, id: "doesn't exit"
    assert_response :not_found
  end
  
  test "that ver are assignes on successful profile viewing" do
    get :show, id: users(:alexander).profile_name
    assert assigns(:user)
    assert_not_empty assigns(:statuses)
  end
  
  test "cocrrect user's statuses" do
   get :show, id: users(:alexander).profile_name
   assigns(:statuses).each do |status|
    assert_equal users(:alexander), status.user
   end
  end

end
