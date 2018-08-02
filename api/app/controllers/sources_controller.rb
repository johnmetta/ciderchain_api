class SourcesController < ApplicationController
  before_action :set_source, only: [:show, :edit, :update, :destroy]

  def index
    @sources = Source.all
    respond_to do |format|
      format.html
      format.json { render json: SourcePresenter.collection(@sources).as_json }
    end
  end

  # GET /units/1
  # GET /units/1.json
  def show
    respond_to do |format|
      format.html
      format.json { render json: @source }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_source
    @source = Source.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def source_params
    params.require(:source).permit(:name, :notes)
  end

end
