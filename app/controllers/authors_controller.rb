class AuthorsController < ApplicationController
load_and_authorize_resource :except => [:create]

  respond_to :html
  def show
    @books = Book.where(author_id: @author.id).find_all
  end
  private

    def author_params
      params.require(:author).permit(:firstname, :lastname, :biography)
    end
end
