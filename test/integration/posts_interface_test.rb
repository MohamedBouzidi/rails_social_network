require 'test_helper'

class PostsInterfaceTest < ActionDispatch::IntegrationTest

  def setup
    @post = posts(:one)
    @user = users(:one)
  end

  # test "posts interface test" do
  #   log_in @user
  #   get root_url

  #   assert_select "section.user_info"
  #   assert_select "section.thumbnail"
  #   assert_select "section.feed"
  #   assert_select "div.details"

  # end

end
