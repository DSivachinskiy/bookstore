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
    redirect_to :back
  end
  def edit
    @order_items = @order.order_items
  end  
  def update
    if current_costumer.adress.present?
      @order.adress_id = current_costumer.adress.id
    end
    if current_costumer.billing_adress.present?
      @order.billing_adress_id = current_costumer.billing_adress.id
    end
    if current_costumer.credit_card.present?
      @order.credit_card_id = current_costumer.credit_card.id
    end
    if @order.update(order_params)
     redirect_to :back, notice: t('order_update')     
    else
      redirect_to :back, alert: t('something_wrong') 
    end
    
  end

  def destroy
    if @order.destroy
      redirect_to books_path, notice: t('order_destroy')  
    end
  end

  private

    def order_params
      params.require(:order).permit(:total_price, :completed_date, :adress_id, :billing_adress_id, :credit_card_id, :aasm_state, :costumer_id, :ups, :coupon_number)
    end
end
