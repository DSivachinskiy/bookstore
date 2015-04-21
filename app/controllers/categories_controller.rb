class CategoriesController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  respond_to :html

  def show
    @books = Book.where(category_id: @category.id).find_all
  end
  def create
    @category = Category.new(category_params)
    @category.save
    respond_to do |format|
      if @category.save
        format.html { redirect_to books_path, notice: 'Category succesfully created!' }     
      else
        format.html { redirect_to :back, notice: 'Wrong filled fields!' } 
      
      end
    end
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end
end
