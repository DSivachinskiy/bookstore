class BillingAdressesController < ApplicationController
  before_action :set_billing_adress, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @billing_adresses = BillingAdress.all
    respond_with(@billing_adresses)
  end

  def show
    respond_with(@billing_adress)
  end

  def new
    @billing_adress = BillingAdress.new
    respond_with(@billing_adress)
  end

  def edit
  end

  def create
    @billing_adress = BillingAdress.new(billing_adress_params)
    @billing_adress.save
    respond_with(@billing_adress)
  end

  def update
    @billing_adress.update(billing_adress_params)
    respond_with(@billing_adress)
  end

  def destroy
    @billing_adress.destroy
    respond_with(@billing_adress)
  end

  private
    def set_billing_adress
      @billing_adress = BillingAdress.find(params[:id])
    end

    def billing_adress_params
      params.require(:billing_adress).permit(:adress, :zipcode, :city, :phone, :country)
    end
end