class ApplicationController < ActionController::Base
  before_action :getCategory
  before_action :getUser
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])

  end

  private
  def getCategory
    @getCategory = Category.all
  end

  def getUser
    @getUser = User.all
  end
end
