class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :private])
  end

  def after_sign_in_path_for(resource)
    root_path
  end
  
  
  skip_forgery_protection
end
