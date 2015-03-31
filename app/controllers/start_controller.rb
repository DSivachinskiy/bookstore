class StartController < ApplicationController
	def index
    @books = Book.all
  end
end
