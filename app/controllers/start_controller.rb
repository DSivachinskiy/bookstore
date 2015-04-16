class StartController < ApplicationController
	def index
    @books = Book.all
    @order_item = OrderItem.new
    @firstbook = Book.first
  end
end
