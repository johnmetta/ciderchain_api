class RackingsController < ApplicationController
  before_action :set_racking, only: [:show, :edit, :update, :destroy]

  # GET /rackings
  # GET /rackings.json
  def index
    @rackings = Racking.all
  end

  # GET /rackings/1
  # GET /rackings/1.json
  def show
  end

  # GET /rackings/new
  def new
    @racking = Racking.new
  end

  # GET /rackings/1/edit
  def edit
  end

  # POST /rackings
  # POST /rackings.json
  def create
    binding.pry
    @racking = Racking.new(racking_params)

    respond_to do |format|
      if @racking.save
        format.html { redirect_to @racking, notice: 'Racking was successfully created.' }
        format.json { render :show, racking: :created, location: @racking }
      else
        format.html { render :new }
        format.json { render json: @racking.errors, racking: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rackings/1
  # PATCH/PUT /rackings/1.json
  def update
    respond_to do |format|
      if @racking.update(racking_params)
        format.html { redirect_to @racking, notice: 'Racking was successfully updated.' }
        format.json { render :show, racking: :ok, location: @racking }
      else
        format.html { render :edit }
        format.json { render json: @racking.errors, racking: :unprocessable_entity }
      end
    end
  end

  # DELETE /rackings/1
  # DELETE /rackings/1.json
  def destroy
    @racking.destroy
    respond_to do |format|
      format.html { redirect_to rackings_url, notice: 'Racking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_racking
      @racking = Racking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def racking_params
      params.require(:racking).permit(:volume, :batch_id, :unit_id, :state_id, :vessel_id, :old_state_id, :dragged)
    end
end
