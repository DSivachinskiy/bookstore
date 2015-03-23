class AuthorsController < ApplicationController
load_and_authorize_resource :except => [:create]

  respond_to :html

  def create
    @author = Author.new(author_params)
    @author.save
    respond_with(@author)
  end

  def update
    @author.update(author_params)
    respond_with(@author)
  end

  def destroy
    @author.destroy
    respond_with(@author)
  end

  private

    def author_params
      params.require(:author).permit(:firstname, :lastname, :biography)
    end
end
