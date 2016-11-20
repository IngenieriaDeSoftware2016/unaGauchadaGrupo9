class CompraController < ApplicationController
  def index
  end

  def show
    @compra = Compra.find(params[:id])
  end

  def create
    @compra = compra.new(compra_params)
    if(@compra.save)
      flash[:notice]="Compra Realizada"
    else
      message=""
      @compra.errors.full_messages.each do |msg|
        message=message+msg+"\n"
      end
      flash[:error]=message
    end
    redirect_to :back
  end

  def new
    @compra = Compra.new
  end

  def edit
    @compra = Compra.find(params[:id])
  end

end
