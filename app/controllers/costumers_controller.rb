class CostumersController < ApplicationController
  before_action :set_costumer, only: [:show, :edit, :update]

  # GET /costumers
  # GET /costumers.json
 

  # GET /costumers/1
  # GET /costumers/1.json
  def show
  end

  # GET /costumers/new
 

  # GET /costumers/1/edit
  def edit
  end

  # POST /costumers
  # POST /costumers.json
 

  # PATCH/PUT /costumers/1
  # PATCH/PUT /costumers/1.json
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

  # DELETE /costumers/1
  # DELETE /costumers/1.json
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_costumer
      @costumer = Costumer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def costumer_params
      params.require(:costumer).permit(:firstname, :lastname)
    end
end
