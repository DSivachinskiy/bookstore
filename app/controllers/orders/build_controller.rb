class Orders::BuildController < ApplicationController
include Wicked::Wizard

  steps :billing_adress, :shipping_adress, :credit_card

  def show
    @order = Order.find(params[:order_id])
    render_wizard
  end


  def update
    @order = Order.find(params[:order_id])
    params[:order][:aasm_state] = 'shipped' if step == steps.last
    
    @order.update_attributes(params[:order])
    render_wizard @order
  end


  def create
    @order = Order.create
    redirect_to wizard_path(steps.first, :order_id => @order.id)
  end
end
