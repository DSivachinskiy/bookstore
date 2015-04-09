class OrderItemsController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  def create
    @order_item = OrderItem.new(order_item_params)
     @order_item.book_id = cookies[:id]
       
    current_order.find do |o|
      @order_item.order_id = o.id
        
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to edit_order_path(o), notice: 'Order item was successfully created.' }
        format.json { render :show, status: :created, location: o }
      else
        format.html { render :new }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
    end
  end
  def edit
    current_order.find do |o|
      @order=o
    end  
  end  
  def update
   @order_item.update(order_item_params)
    redirect_to :back
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
