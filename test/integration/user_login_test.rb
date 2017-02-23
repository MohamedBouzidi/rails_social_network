require 'test_helper'

class UserLoginTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:one)
  end

  test "should render correct template and layout" do
    get login_url
    assert_select "input[type=email]", count: 1
    assert_select "input[type=password]", count: 1
    assert_select "input[type=submit]", count: 1
    assert_select "a[href=?]", signup_url, count: 1
    assert_template 'sessions/new'
  end

  test "should show errors on invalid login information" do
    post login_url, params: { user: { email: @user.email, password: '' } }
    assert_not flash.empty?
    assert_template 'sessions/new'
  end

  test "should redirect on valid login information" do
    post login_url, params: { user: { email: @user.email, password: 'foobar' } }
    assert_redirected_to root_url
    follow_redirect!
    assert_not flash.empty?
    assert_template 'static_pages/home'
  end

end
