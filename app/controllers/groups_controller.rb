class GroupsController < InheritedResources::Base
  actions :all
  respond_to :html, :json, :xml
  
  def index
    @groups = Customer.find(current_customer.id).groups
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
