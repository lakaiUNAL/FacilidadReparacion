require 'test_helper'

class Tecnico::SuportsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get tecnico_suports_update_url
    assert_response :success
  end

  test "should get destroy" do
    get tecnico_suports_destroy_url
    assert_response :success
  end

  test "should get create" do
    get tecnico_suports_create_url
    assert_response :success
  end

end
