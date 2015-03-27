class AdressesController < ApplicationController
load_and_authorize_resource :except => [:create]
  
  respond_to :html

  def create
    @adress = Adress.new(adress_params)
    @adress.costumer_id = current_costumer.id
    @adress.save
     redirect_to current_costumer
  end

  def update
    cookies[:shipping_adress_id] = @adress.id
    @adress.update(adress_params)
    redirect_to :back
     
  end

  def destroy
    @adress.destroy
   redirect_to current_costumer
  end

  private

    def adress_params
      params.require(:adress).permit(:adress, :zipcode, :city, :phone, :country_id)
    end
end
