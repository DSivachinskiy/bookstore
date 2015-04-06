class CheckoutController < ApplicationController
  def adress
  	unless current_costumer.billing_adress.nil?
      @billing_adress = current_costumer.billing_adress
    else
      @billing_adress = BillingAdress.new
    end
    unless current_costumer.adress.nil?
      @adress = current_costumer.adress
    else
      @adress = Adress.new
    end
  end
  def payment
  	unless current_costumer.credit_card.nil?
      @credit_card = current_costumer.credit_card
    else
      @credit_card = CreditCard.new
    end
  end	
end
