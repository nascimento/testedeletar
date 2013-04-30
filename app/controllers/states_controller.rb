class StatesController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  actions :all
  respond_to :html, :json, :xml
  
  caches_page :index
  
  def update
    update!{states_url}
  end
  def create
   create!{states_url}
  end
end
