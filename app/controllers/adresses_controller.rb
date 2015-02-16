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
    @adress.save
    respond_with(@adress)
  end

  def update
    @adress.update(adress_params)
    respond_with(@adress)
  end

  def destroy
    @adress.destroy
    respond_with(@adress)
  end

  private
    def set_adress
      @adress = Adress.find(params[:id])
    end

    def adress_params
      params.require(:adress).permit(:adress, :zipcode, :city, :phone, :country)
    end
end
