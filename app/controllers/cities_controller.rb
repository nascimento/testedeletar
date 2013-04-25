class CitiesController < InheritedResources::Base
  before_filter :authenticate_user!
  
  actions :all
  respond_to :html, :json, :xml
  
  def update
    update!{cities_url}
  end
  def create
   create!{cities_url}
  end
end