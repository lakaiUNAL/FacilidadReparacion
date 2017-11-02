require 'test_helper'

class Cliente::TecnicosInteresadosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cliente_tecnicos_interesados_index_url
    assert_response :success
  end

  test "should get show" do
    get cliente_tecnicos_interesados_show_url
    assert_response :success
  end

  test "should get destroy" do
    get cliente_tecnicos_interesados_destroy_url
    assert_response :success
  end

end
