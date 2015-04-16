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
    @book.img
    respond_with(@book)
  end

  def update
    @book.update(book_params)
    respond_with(@book)
  end

  def destroy
    @book.destroy
    respond_with(@book)
  end

  private
    def book_params
      params.require(:book).permit(:title, :description, :price, :books_in_stock, :author_id, :category_id)
    end
end
