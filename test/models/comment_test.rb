require 'test_helper'

class CommentTest < ActiveSupport::TestCase

  def setup
    @comment = comments(:one)
  end

  test "user_id should be present" do
    @comment.user_id = nil
    assert_not @comment.valid?
  end

  test "body should be present" do
    @comment.body = "     "
    assert_not @comment.valid?
  end

end
