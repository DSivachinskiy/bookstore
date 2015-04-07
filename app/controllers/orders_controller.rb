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
    
    @order.adress_id = current_costumer.adress.id
    @order.billing_adress_id = current_costumer.billing_adress.id
    @order.credit_card_id = current_costumer.credit_card.id
    @order.update(order_params)
  
    redirect_to :back
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private

    def order_params
      params.require(:order).permit(:total_price, :completed_date, :adress_id, :billing_adress_id, :credit_card_id, :aasm_state, :costumer_id, :ups)
    end
end
