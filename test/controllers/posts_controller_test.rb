require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
    @post = posts(:one)
  end

  test "should get new" do
    get new_user_post_url @user.id
    assert_response :success
  end

  test "should get edit" do
    get edit_post_url(@post)
    assert_response :success
  end

  test "should get show" do
    get post_url(@post)
    assert_response :success
  end

end
