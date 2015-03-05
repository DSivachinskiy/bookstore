class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
 before_filter :configure_permitted_parameters, if: :devise_controller?

 helper_method :current_order
 helper_method :last_book


def current_order
 @current_order = Order.where(costumer_id: current_costumer.id).where(order_status_id: 1)
end

def last_book
 cookies[:id] = @book.id
end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :firstname << :lastname
   end


  
end
