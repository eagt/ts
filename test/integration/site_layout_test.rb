require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'					
    assert_select "a[href=?]", root_path,  count: 1		# This ensures that link to the Home page is present. In case there were more
    													# links is possible to add them and put them on the count: 2,3,..or any given value of links
    assert_select "a[href=?]", help_path				# Rails automatically inserts the value of help_path in place of the question mark 
    													# (escaping any special characters if necessary)
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_us_path
  end
end
