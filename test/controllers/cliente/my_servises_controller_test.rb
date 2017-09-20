require 'test_helper'

class Cliente::MyServisesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cliente_my_servises_index_url
    assert_response :success
  end

  test "should get new" do
    get cliente_my_servises_new_url
    assert_response :success
  end

  test "should get show" do
    get cliente_my_servises_show_url
    assert_response :success
  end

  test "should get edit" do
    get cliente_my_servises_edit_url
    assert_response :success
  end

end
