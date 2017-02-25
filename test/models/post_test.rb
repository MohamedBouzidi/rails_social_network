require 'test_helper'

class PostTest < ActiveSupport::TestCase

  def setup
    @post = Post.new(user_id: 1, body: 'Lorem Ipsum')
  end

  test "body should be present" do
    @post.body = "      "
    assert_not @post.valid?
  end

  test "user_id should be present" do
    @post.user_id = nil
    assert_not @post.valid?
  end

end
