class RatingsController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  respond_to :html

  def create
    @rating = Rating.new(rating_params)
    @rating.book_id = cookies[:id] 
    @rating.costumer_id = current_costumer.id
    @rating.save
    Book.where(id: cookies[:id]).find do |book|
      redirect_to book_path(book)
    end  
  end

  def update
    @rating.update(rating_params)
    respond_with(@rating)
  end

  def destroy
    @rating.destroy
    redirect_to :back
  end

  private

    def rating_params
      params.require(:rating).permit(:texxt_review, :rating_number, :book_id, :costumer_id, :title)
    end
end
