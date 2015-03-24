class Costumers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
  	  @costumer = Costumer.find_for_facebook_oauth request.env["omniauth.auth"]
    if @costumer.persisted?
      
      sign_in_and_redirect @costumer, :event => :authentication
    else
      flash[:notice] = "authentication error"
      redirect_to root_path
    end
    end
end
