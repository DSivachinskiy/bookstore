class BillingAdressesController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  respond_to :html

  def create
    @billing_adress = BillingAdress.new(billing_adress_params)
    @billing_adress.costumer_id = current_costumer.id
     
    respond_to do |format|
      if @billing_adress.save
        format.html { redirect_to :back, notice: t('billing_adress_create')}     
      else
        format.html { redirect_to :back, alert: t('wrong_filled_fields') } 
      end
    end
  end

  def update
    cookies[:billing_adress_id] = @billing_adress.id
    if @billing_adress.update(billing_adress_params)
      redirect_to :back, notice: t('billing_adress_update') 
    else
      redirect_to :back, alert: t('wrong_filled_fields')      
    end
  end


  private

    def billing_adress_params
      params.require(:billing_adress).permit(:adress, :zipcode, :city, :phone, :country_id, :shipping)
    end
end
