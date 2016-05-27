class ApplicationController < ActionController::Base
  before_action :getCategory
  before_action :getUser
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image, :city, :country])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image, :city, :country])

  end

  def after_sign_in_path_for(resource)
    current_user
  end

  private
  
    def getCategory
      @getCategory = Category.all
    end

    def getUser
      @getUser = User.all
    end


    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
end
