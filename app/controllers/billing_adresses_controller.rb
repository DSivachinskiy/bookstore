class BillingAdressesController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  respond_to :html

  def create
    @billing_adress = BillingAdress.new(billing_adress_params)
    @billing_adress.costumer_id = current_costumer.id
    @billing_adress.save
     redirect_to current_costumer
  end

  def update
    cookies[:billing_adress_id] = @billing_adress.id
    @billing_adress.update(billing_adress_params)
     
    redirect_to :back
    
  end

  def destroy
    @billing_adress.destroy
     redirect_to current_costumer
  end

  private

    def billing_adress_params
      params.require(:billing_adress).permit(:adress, :zipcode, :city, :phone, :country_id)
    end
end
