require 'test_helper'

class UserFriendshipsControllerTest < ActionController::TestCase
  context "#new" do
   context "when not logged in" do
    should "redirect to the login page" do
     get :new
     assert_response :redirect
    end
   end
   
   context "when logged in" do
    setup do
      sign_in users(:alexander)
    end
    
    should "get the new and return success" do
     get :new
     assert_response :success
    end
    
    should "should set a flash error if the friend_id params is missing" do
     get :new, {}
     assert_equal "Friend required", flash[:error]
    end
    
    should "display friens name" do
     get :new, friend_id: users(:mello)
     assert_match /#{users(:mello).full_name}/, response.body
    end
     
     should "assign a new user friendship" do
      get :new, friend_id: users(:mello)
      assert assigns(:user_friendship)
     end
     
      should "assign a new user friendship to the correct friend" do
      get :new, friend_id: users(:mello)
      assert_equal users(:mello), assigns(:user_friendship).friend
     end
      
      should "assign a new user friendship to the current logged in user" do
      get :new, friend_id: users(:mello)
      assert_equal users(:alexander), assigns(:user_friendship).user
     end
      
      should "404 if no friend is found" do
      get :new, friend_id: 'invalid'
      assert_response :not_found
    end
    
    should "ask if you really want to friend the user" do
     get :new, friend_id: users(:mello)
     assert_match /Do you really want to friend #{users(:mello).full_name}?/, response.body
    end
   end
  end
    
    context "#create" do
     context "not logged in" do
        should "redirect to loggin page" do
         get :new
         assert_response :redirect
         assert_redirected_to login_path
      end
    end
     
     context "when logged in" do
      setup do
       sign_in users(:alexander)
      end
      
      context "with no friend_id" do
        setup do
         post :create
       end
        
      should "set the error flash message" do
       assert !flash[:error].empty?
      end
     end
    end
 end
