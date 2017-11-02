require 'test_helper'

class Tecnico::AgendaControllerTest < ActionDispatch::IntegrationTest
  test "should get trabajos" do
    get tecnico_agenda_trabajos_url
    assert_response :success
  end

  test "should get cancelar" do
    get tecnico_agenda_cancelar_url
    assert_response :success
  end

end
