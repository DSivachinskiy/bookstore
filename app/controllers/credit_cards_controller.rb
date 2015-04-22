class CreditCardsController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  respond_to :html
 
  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.costumer_id = current_costumer.id
   
    respond_to do |format|
      if @credit_card.save
        format.html { redirect_to :back, notice: t('credit_card_create') }     
       else
        format.html { redirect_to :back, alert: t('wrong_filled_fields') } 
      end
    end
  end

  def update
    cookies[:credit_card_id] = @credit_card.id
    if @credit_card.update(credit_card_params)
      redirect_to :back, notice: t('credit_card_update')     
    else
      redirect_to :back, alert: t('wrong_filled_fields') 
    end
  end


  private
   
    def credit_card_params
      params.require(:credit_card).permit(:number, :cvv, :expiration_month, :expiration_year, :firstname, :lastname)
    end
end
