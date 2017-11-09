require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
    @poster = posts(:one)
  end
  
  test "title" do
    assert @poster.valid?
  end

  test "Not title" do
    @poster.title = " "
    assert_not @poster.valid?
  end
  
  test "Not text" do
    @poster.body = " "
    assert_not @poster.valid?
  end
  
end
