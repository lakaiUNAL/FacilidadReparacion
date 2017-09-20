require 'test_helper'

class FreeServicesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get free_services_index_url
    assert_response :success
  end

  test "should get show" do
    get free_services_show_url
    assert_response :success
  end

  test "should get new" do
    get free_services_new_url
    assert_response :success
  end

  test "should get edit" do
    get free_services_edit_url
    assert_response :success
  end

end
