class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :current_customer
  helper_method :current_customer

private

    def current_customer
      # Adiciona o host do cliente em questão no Mailer, para não dar conflito de ip nos emails.
      ActionMailer::Base.default_url_options = {:host => request.host}
      
      # Armazena o cliente em questão em sessão.
      session[:current_user] ||= Customer.where(:hostname => request.host).first
      
    end
    
end
