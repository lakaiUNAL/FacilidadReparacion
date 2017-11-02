require 'test_helper'

class Tecnico::AcceptControllerTest < ActionDispatch::IntegrationTest
  test "should get success" do
    get tecnico_accept_success_url
    assert_response :success
  end

  test "should get agree" do
    get tecnico_accept_agree_url
    assert_response :success
  end

end
