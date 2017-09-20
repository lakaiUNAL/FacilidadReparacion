require 'test_helper'

class MyServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_services_index_url
    assert_response :success
  end

  test "should get show" do
    get my_services_show_url
    assert_response :success
  end

  test "should get new" do
    get my_services_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_services_edit_url
    assert_response :success
  end

end
