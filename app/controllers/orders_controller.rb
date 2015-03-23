class OrdersController < ApplicationController
  load_and_authorize_resource :except => [:create]

  respond_to :html

  def create
    @order = Order.new(order_params)
    @order.costumer_id = current_costumer.id
  
    @order.save
    respond_with(@order)
  end

  def update
    @order.ship
    @order.update(order_params)
  
    redirect_to orders_path
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private

    def order_params
      params.require(:order).permit(:total_price, :completed_date, :adress_id, :billing_adress_id, :credit_card_id, :aasm_state, :costumer_id)
    end
end
