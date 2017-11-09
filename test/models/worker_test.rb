require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @tec = workers(:fernando)
    #puts @tec.email
    assert true
  end
  
  test "proof_email" do
    assert @tec.valid?
  end
  
  test "pass" do
    @tec.password = " "
    assert @tec.valid?
  end
  
  test "change_email" do
    @tec.email = "¬¬";
    assert_not @tec.valid?
  end  
  
  
end
