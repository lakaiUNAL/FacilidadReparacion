require 'test_helper'

class CustomerTest < ActiveSupport::TestCase
   def setup
     #@elemento = Customer.new("Mariana", "test@prueba.com", "2001-02-23", nil, "", 3168956478, "", "prueba_model", 4.66666, -74.12222 )
     #@elemento = customers(:juan_carlos)
     @customer = customers(:juan_carlos)
     #puts @elemento.user_name
     assert true
   end


   test 'prueba email' do
     assert @customer.valid?
   end
   
   test 'Not mail' do
     @customer.email = " "
     assert_not @customer.valid?
   end
   

   
end
