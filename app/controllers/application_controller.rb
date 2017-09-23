class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_name, 
    :email ])
    #in keys you list all the input you want to accept.
  end
  
  def after_sign_in_path_for(resource)
    if worker_signed_in?
      about_path
    elsif customer_signed_in?
      request_service_path
    end
  end
  
  def after_sign_up_path_for(resource)
    if worker_signed_in?
      about_path
    elsif customer_signed_in?
      about_path
    end
  end
end
