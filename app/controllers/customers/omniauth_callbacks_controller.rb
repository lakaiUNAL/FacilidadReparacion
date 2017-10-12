 class Customers::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    ##@customer = Customer.from_omniauth(request.env["omniauth.auth"])
    @customer = Customer.from_facebook(request.env["omniauth.auth"])

    if @customer.persisted?
    #  ##sign_in_and_redirect @customer, :event => :authentication
        sign_in_and_redirect @customer, event: :authentication
    #  set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
    #  ##session["devise.facebook_data"] = request.env["omniauth.auth"]
      session["devise.facebook"] = request.env["omniauth.auth"]
      redirect_to new_customer_registration_url
    #  # redirect_to blog_path
    end
  end
  
  #end
  #def failure
  #  redirect_to root_path
  #end
end