class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_name, :email ])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_name, :email, :birth_date, 
                                                           :number_card, :address, :phone_number, :picture])
  end
  
  def after_sign_in_path_for(resource)
    if worker_signed_in?
      worker_services_path
    elsif customer_signed_in?
      request_service_path
    end
  end
  
  def after_sign_up_path_for(resource)
    if worker_signed_in?
      about_path
    elsif customer_signed_in?
      edit_worker_registration 
    end
  end
  
end
