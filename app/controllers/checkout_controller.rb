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
    current_order.find do |o|
       @order = o
     end 
  end	
  def delivery
     current_order.find do |o|
       @order = o
     end 
     
  end  
  def confirm
    current_order.find do |o|
      @order = o
    end 
    @order_items = @order.order_items
  end
  def complete
    current_order.find do |o|
      @order = o
    end 
    @order.accept
  end
end
