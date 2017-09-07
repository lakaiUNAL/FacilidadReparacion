require 'test_helper'

class AboutControllerTest < ActionDispatch::IntegrationTest
  test "should get us" do
    get about_us_url
    assert_response :success
  end

  test "should get contact" do
    get about_contact_url
    assert_response :success
  end

  test "should get blog" do
    get about_blog_url
    assert_response :success
  end

end
