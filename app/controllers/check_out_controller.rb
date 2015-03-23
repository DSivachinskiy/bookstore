class CheckOutController < ApplicationController
	include Wicked::Wizard

	steps :billing_adress, :shipping_adress, :credit_card
  def show
    @billing_adress = BillingAdress.find(params[:product_id])
    render_wizard
  end

  def update
    @billing_adress = BillingAdress.new
    @billing_adress.update_attributes(params[:billing_adress])
    render_wizard @billing_adress
  end
end
