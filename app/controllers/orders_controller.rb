class OrdersController < ApplicationController
  load_and_authorize_resource :except => [:create]

  respond_to :html
  def show
    @order_items = @order.order_items
  end
  def create
    @order = Order.new(order_params)
    @order.costumer_id = current_costumer.id
    
    @order.save
    redirect_to new_order_item_path
  end

  def update
    @order.accept
    @order.adress_id = cookies[:shipping_adress_id]
    @order.billing_adress_id = cookies[:billing_adress_id]
    @order.credit_card_id = cookies[:credit_card_id]
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
