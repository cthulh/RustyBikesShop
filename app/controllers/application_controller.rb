class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to request.referer || root_path, :alert => exception.message
  end

  # Pagination global default
  WillPaginate.per_page = 3

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit(:first_name, :last_name, :email, :password)
  	end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:frst_name, :last_name,:email, :password, :password_confirmation, :current_password)
    end
  end

end
