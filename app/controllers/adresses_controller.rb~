class AdressesController < ApplicationController
  before_action :set_adress, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @adresses = Adress.all
    respond_with(@adresses)
  end

  def show
    respond_with(@adress)
  end

  def new
    @adress = Adress.new
    respond_with(@adress)
  end

  def edit
  end

  def create
    @adress = Adress.new(adress_params)
    @adress.costumer_id = current_costumer.id
    @adress.save
     redirect_to current_costumer
  end

  def update
    @adress.update(adress_params)

     redirect_to current_costumer
  end

  def destroy
    @adress.destroy
   redirect_to current_costumer
  end

  private
    def set_adress
      @adress = Adress.find(params[:id])
    end

    def adress_params
      params.require(:adress).permit(:adress, :zipcode, :city, :phone, :country_id)
    end
end
