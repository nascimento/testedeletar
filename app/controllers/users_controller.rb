class UsersController < InheritedResources::Base
  actions :index, :show
  respond_to :html, :json, :xml
  
  # def update
  #   update!{users_url}
  # end
  # def create
  #   create!{users_url}
  # end
end
