class CustomersController < InheritedResources::Base
  before_filter :authenticate_user!
  
  actions :all
  respond_to :html, :json, :xml
  
  def update
    update!{customers_url}
  end
  def create
   create!{customers_url}
  end
end
