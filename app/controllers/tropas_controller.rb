class TropasController < ApplicationController
  before_action :set_tropa, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @tropas = Tropa.all
    respond_with(@tropas)
  end

  def show
    respond_with(@tropa)
  end

  def new
    @tropa = Tropa.new
    respond_with(@tropa)
  end

  def edit
  end

  def create
    @tropa = Tropa.new(tropa_params)
    @tropa.save
    respond_with(@tropa)
  end

  def update
    @tropa.update(tropa_params)
    respond_with(@tropa)
  end

  def destroy
    @tropa.destroy
    respond_with(@tropa)
  end

  private
    def set_tropa
      @tropa = Tropa.find(params[:id])
    end

    def tropa_params
      params.require(:tropa).permit(:nombre, :costo, :ataque, :defensa, :num_guerreros, :historia)
    end
end
