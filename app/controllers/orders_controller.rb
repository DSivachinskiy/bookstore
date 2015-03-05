class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @orders = Order.all
  end



  def show
    respond_with(@order)
  end

  def new
    @order = Order.new
    respond_with(@order)
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.costumer_id = current_costumer.id
  
    @order.save
    respond_with(@order)
  end

  def update
    @order.update(order_params)
    
    redirect_to orders_path
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:total_price, :completed_date, :adress_id, :billing_adress_id, :credit_card_id, :order_status_id, :costumer_id)
    end
end
