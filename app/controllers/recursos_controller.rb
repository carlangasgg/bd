class RecursosController < ApplicationController
  before_action :set_recurso, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  respond_to :html, :xml, :json

  def index
    @recursos = Recurso.all
    respond_with(@recursos)
  end

  def show
    respond_with(@recurso)
  end

  def new
    @recurso = Recurso.new
    respond_with(@recurso)
  end

  def edit
  end

  def create
    @recurso = Recurso.new(recurso_params)
    @recurso.save
    respond_with(@recurso)
  end

  def update
    @recurso.update(recurso_params)
    respond_with(@recurso)
  end

  def destroy
    @recurso.destroy
    respond_with(@recurso)
  end

  private
    def set_recurso
      @recurso = Recurso.find(params[:id])
    end

    def recurso_params
      params.require(:recurso).permit(:nombre)
    end
end
