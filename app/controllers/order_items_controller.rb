class OrderItemsController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  def create
    @order_item = OrderItem.new(order_item_params)
     @order_item.book_id = cookies[:id]
       
    current_order.find do |o|
      @order_item.order_id = o.id
    end
    
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to @order_item, notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: @order_item }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order_item.update(order_item_params)
        format.html { redirect_to @order_item, notice: 'Order item was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_item }
      else
        format.html { render :edit }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Order item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def order_item_params
      params.require(:order_item).permit(:quantity, :order_id, :book_id)
  
    end
end
