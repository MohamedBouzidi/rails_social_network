require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = users(:one)
  end

  test "name should be present" do
    @user.name = "   "
    assert_not @user.valid?
  end

  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "name should have appropriete length" do
    @user.name = 'a' * 21
    assert_not @user.valid?
  end

  test "email should have appropriete length" do
    @user.email = 'a' * 256
    assert_not @user.valid?
  end

  test "valid emails should be allowed" do
    valid_addresses = %w[user@home.com user12@home.fr leon-big.boss@domain.us archer-12.valid@addr.fd]
    valid_addresses.each do |valid|
      @user.email = valid
      assert @user.email
    end
  end

  test "invalid emails should be rejected" do
    invalid_addresses = %w[user@home,com invalid.address invalid @invalid.addr]
    invalid_addresses.each do |invalid|
      @user.email = invalid
      assert_not @user.valid?
    end
  end

end
