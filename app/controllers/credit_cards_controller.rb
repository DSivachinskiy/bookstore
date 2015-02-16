class CreditCardsController < ApplicationController
  before_action :set_credit_card, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @credit_cards = CreditCard.all
    respond_with(@credit_cards)
  end

  def show
    respond_with(@credit_card)
  end

  def new
    @credit_card = CreditCard.new
    respond_with(@credit_card)
  end

  def edit
  end

  def create
    @credit_card = CreditCard.new(credit_card_params)
    @credit_card.save
    respond_with(@credit_card)
  end

  def update
    @credit_card.update(credit_card_params)
    respond_with(@credit_card)
  end

  def destroy
    @credit_card.destroy
    respond_with(@credit_card)
  end

  private
    def set_credit_card
      @credit_card = CreditCard.find(params[:id])
    end

    def credit_card_params
      params.require(:credit_card).permit(:number, :cvv, :expiration_month, :expiration_year, :firstname, :lastname)
    end
end
