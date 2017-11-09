require 'test_helper'

class Sprint5Test < ActionDispatch::IntegrationTest


  test "should sing up" do

    get new_customer_registration_path
    assert_response :success

    post customer_registration_path, params: { customer: { name: " ", user_name: "", email: " ", password: " ", password_confirmation: " "  } }

    #assert_redirected_to customer_registration_path
    assert_template 'customers/registrations/new'

		post customer_registration_path, params: { customer: { name: "Juan Caros Gama", user_name: "juancho", email: "jcgamar@unal.edu.co", password: "12345678", password_confirmation: "12345678"  } }    

		assert_redirected_to root_path

  end

end
