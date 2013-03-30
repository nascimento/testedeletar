class UsersController < InheritedResources::Base
  actions :index, :show, :destroy
  respond_to :html, :json, :xml

  def index
    @users = Customer.find(current_customer.id).users
    super
  end
end
