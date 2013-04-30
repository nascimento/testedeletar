class GroupsController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource

  actions :all
  respond_to :html, :json, :xml
  
  def index
    @groups = Customer.find(current_customer.id).groups.order('lft ASC')
    super
  end
  def edit
    @users = Customer.find(current_customer.id).users
    @permissions = Permission.all
    super
  end
  def new
    @users = Customer.find(current_customer.id).users
    @permissions = Permission.all
    super
  end
  def update
    update!{groups_url}
  end
  def create
    params[:group][:customer_id] = current_customer.id
    super do |format|
      format.html { redirect_to groups_url }
    end    
  end
end
