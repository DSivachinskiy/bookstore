class CostumersController < ApplicationController
load_and_authorize_resource

def show
  @billing_adress = current_costumer.billing_adress
  @adress = current_costumer.adress
  @credit_card = current_costumer.credit_card
end
  def update

    respond_to do |format|
      if @costumer.update(costumer_params)
        format.html { redirect_to @costumer, notice: 'Costumer was successfully updated.' }
        format.json { render :show, status: :ok, location: @costumer }
      else
        format.html { render :edit }
        format.json { render json: @costumer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def costumer_params
      params.require(:costumer).permit(:firstname, :lastname)
    end
end
