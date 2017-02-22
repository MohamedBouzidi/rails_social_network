require 'test_helper'

class StaticPagesLayoutTest < ActionDispatch::IntegrationTest

  test "should obtain correct application layout" do
    get root_url
    assert_response :success
    # Root url selection
    assert_select 'a[href=?][id=?]', root_url, 'logo_bottom', count: 1
    assert_select 'a[href=?][id=?]', root_url, 'logo', count: 1
    assert_select 'a[href=?]', root_url, count: 3
    
    # Other url selection
    assert_select 'a[href=?]', help_path, count: 2
    assert_select 'a[href=?]', about_path, count: 1
    assert_select 'a[href=?]', contact_path, count: 1
  end

end
