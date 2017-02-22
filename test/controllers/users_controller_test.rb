require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:one)
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should get create" do
    post users_url, params: { name: @user.name, email: @user.email }
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url @user
    assert_response :success
  end

  test "should get update" do
    patch user_url @user, params: { name: @user.name, email: @user.email }
    assert_response :success
  end

end
