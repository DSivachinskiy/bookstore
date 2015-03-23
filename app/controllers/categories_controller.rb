class CategoriesController < ApplicationController
load_and_authorize_resource :except => [:create]
 
  respond_to :html

  def create
    @category = Category.new(category_params)
    @category.save
    respond_with(@category)
  end

  def update
    @category.update(category_params)
    respond_with(@category)
  end

  def destroy
    @category.destroy
    respond_with(@category)
  end

  private

    def category_params
      params.require(:category).permit(:title)
    end
end
