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
    if @billing_adress.shipping?
      @adress.adress = @billing_adress.adress
      @adress.zipcode = @billing_adress.zipcode
      @adress.city = @billing_adress.city
      @adress.phone = @billing_adress.phone
      @adress.country_id = @billing_adress.country_id
      @adress.save
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
    @order_items = @order.order_items

    @order.accept
    @order.adress_id = current_costumer.adress.id
    @order.billing_adress_id = current_costumer.billing_adress.id
    @order.credit_card_id = current_costumer.credit_card.id
    @order.save
  end
end
