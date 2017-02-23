require 'test_helper'

class UserLogoutTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "should not logout if not logged in" do
    get logout_url
    assert_redirected_to root_url
  end

  test "should redirect after logout" do
    post login_url, params: { user: { email: @user.email, password: 'foobar' } }
    get logout_url
    assert_redirected_to root_url
  end

end
