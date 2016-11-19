class CompraController < ApplicationController
  def index
  end

  def show
    @compra = Compra.find(params[:id])
  end

  def create
  end

  def new
    @compra = Compra.new
  end

  def edit
    @compra = Compra.find(params[:id])
  end
end
