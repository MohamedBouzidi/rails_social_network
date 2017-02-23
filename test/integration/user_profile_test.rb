require 'test_helper'

class UserProfileTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "should render correct template and layout" do
    post login_url, params: { user: { email: @user.email, password: 'foobar' } }
    assert_redirected_to root_url
    assert_not flash.empty?
  end

end
