class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_customer
  helper_method :current_customer, :current_permissions_groups
  
  layout :layout_by_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  rescue_from ActiveRecord::DeleteRestrictionError do |exception|
      redirect_to :back, :alert => exception.message
  end

protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end
  end

private

    def current_customer
      # Adiciona o host do cliente em questão no Mailer, para não dar conflito de ip nos emails.
      ActionMailer::Base.default_url_options = {:host => request.host}
      
      # Armazena o cliente em questão em sessão.
      session[:current_customer] ||= Customer.where(:hostname => request.host).first
    end

    def current_permissions_groups
      session[:current_permissions_groups] ||= Permission.uniq.pluck(:subject_class)
    end
    
end
