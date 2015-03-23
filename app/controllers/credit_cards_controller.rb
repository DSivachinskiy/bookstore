class CreditCardsController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  respond_to :html

  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.costumer_id = current_costumer.id
    @credit_card.save
    redirect_to current_costumer
  end

  def update
    @credit_card.update(credit_card_params)
      redirect_to current_costumer
  end

  def destroy
    @credit_card.destroy
    redirect_to current_costumer
  end

  private
   
    def credit_card_params
      params.require(:credit_card).permit(:number, :cvv, :expiration_month, :expiration_year, :firstname, :lastname)
    end
end
