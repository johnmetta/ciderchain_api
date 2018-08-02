class PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def index
    @properties = Property.all
    respond_to do |format|
      format.html
      format.json { render json: PropertyPresenter.collection(@properties).as_json }
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @property }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.require(:property).permit(:name)
  end

end
