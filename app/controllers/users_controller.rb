class UsersController < InheritedResources::Base
  actions :index
  respond_to :html
end
