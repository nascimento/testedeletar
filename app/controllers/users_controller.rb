class UsersController < InheritedResources::Base
  actions :index, :show, :destroy, :edit, :update
  respond_to :html, :json, :xml

  def index
    @users = Customer.find(current_customer.id).users
    super
  end

  def edit
    @groups = Customer.find(current_customer.id).groups.order('lft ASC')
    super
  end

  def update
    update!{users_url}
  end

end
