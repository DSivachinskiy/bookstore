class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  helper_method :current_order
  helper_method :last_book
  alias_method :current_user, :current_costumer

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

 
def current_order
 @current_order = Order.where(costumer_id: current_costumer.id).where(aasm_state: "in_progress")
end

def last_book
 cookies[:id] = @book.id
end

 def set_locale
    I18n.locale = params[:locale] || I18n.default_locale = :uk
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname
   end


  
end
