class BooksController < ApplicationController
load_and_authorize_resource :except => [:create]
  respond_to :html

 

  def show
    @books=Book.all
    cookies[:id] = @book.id
    @order_item = OrderItem.new
    @order = Order.new
  end

  def create
  	@book = Book.new(book_params)
    @book.save
    
    respond_to do |format|
      if @book.save
        format.html { redirect_to books_path, notice: 'Book succesfully created!' }     
      else
        format.html { redirect_to :back, notice: 'Wrong filled fields!' } 
      
      end
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :description, :price, :books_in_stock, :author_id, :category_id)
    end
end
