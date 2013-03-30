class SessionsController < Devise::SessionsController

  def create
    params[:user][:customer_id] = current_customer.id
    super
  end

end