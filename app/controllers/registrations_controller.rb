class RegistrationsController < Devise::RegistrationsController
  protect_from_forgery
  
  def create
    params[:user][:customer_id] = current_customer.id
    super
  end
end
