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

    assert_select "a[href=?]", compasign_path           # Here it verifies that link for Company Sign Up exits

    get compasign_path                                  # Here it actually goes through and get to the Company Sign Up page
    assert_select "title", full_title("Company Sign Up")  # Verifies that the correct title is populated proving the full_title helper

    get root_path                                       # It needs to return to the home page to be able to excute the Professional Sign Up

    assert_select "a[href=?]", profsign_path

    get profsign_path
    assert_select "title", full_title("Professional Sign Up")
  end
end
