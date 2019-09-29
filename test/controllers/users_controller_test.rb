require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    current_user = User.first
    #without rewritting view code,
      # how do I pass current_user without an @?
    @users = User.all
    get users_path
    assert_response :success
  end

  test "should get show" do
    get '/users/1'
    # "ActiveRecord::RecordNotFound: Couldn't find User with 'id'=1"
    # User 1 exist in my IRB, why not here?
    assert_response :success
  end

end
