require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_select "h1", "Welcome to the Sample App"
    assert_select "a[href=?]", root_path, count: 2
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path

    # Check thêm trang signup xem link từ nút bấm trang chủ dẫn sang có đúng không
    get signup_path
    assert_select "title", "Sign up | Ruby on Rails"
  end
end
