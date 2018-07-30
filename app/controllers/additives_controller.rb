class AdditivesController < ApplicationController
  before_action :set_additive, only: [:show, :edit, :update, :destroy]

  def index
    @additives = Additive.all
    respond_to do |format|
      format.html
      format.json { render json: AdditivePresenter.collection(@additives).as_json }
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @additive }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_additive
    @additive = Additive.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def additive_params
    params.require(:additive).permit(:name, :notes)
  end

end
