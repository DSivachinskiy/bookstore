class AdressesController < ApplicationController
load_and_authorize_resource :except => [:create]
  
  respond_to :html

  def create
    @adress = Adress.new(adress_params)
    @adress.costumer_id = current_costumer.id
   
     respond_to do |format|
      if @adress.save
        format.html { redirect_to :back, notice: t('shipping_adress_create')}     
      else
        format.html { redirect_to :back, alert: t('wrong_filled_fields') } 
      
      end
    end
  end

  def update
    cookies[:shipping_adress_id] = @adress.id
    if @adress.update(adress_params)
      redirect_to :back, notice: t('shipping_adress_update')    
    else
      redirect_to :back, alert: t('wrong_filled_fields')
    end
    
     
  end


  private

    def adress_params
      params.require(:adress).permit(:adress, :zipcode, :city, :phone, :country_id, :costumer_id)
    end
end
