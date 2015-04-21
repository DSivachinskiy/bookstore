class AuthorsController < ApplicationController
load_and_authorize_resource :except => [:create]

  respond_to :html

  private

    def author_params
      params.require(:author).permit(:firstname, :lastname, :biography)
    end
end
