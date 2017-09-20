require 'test_helper'

class Cliente::ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cliente_profile_index_url
    assert_response :success
  end

  test "should get new" do
    get cliente_profile_new_url
    assert_response :success
  end

  test "should get show" do
    get cliente_profile_show_url
    assert_response :success
  end

  test "should get edit" do
    get cliente_profile_edit_url
    assert_response :success
  end

end
