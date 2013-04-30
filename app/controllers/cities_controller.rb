class CitiesController < InheritedResources::Base
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  actions :all
  respond_to :html, :json, :xml
  
  caches_page :index
  
  def index
    @cities = City.includes(:state).all
    super
  end
  
  def update
    update!{cities_url}
  end
  def create
   create!{cities_url}
  end
end
