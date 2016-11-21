class ComprasController < ApplicationController
  def index
  end

  def show
    @compra = Compra.find(current_usuario.id)
  end

  def create
    @compra = Compra.new(compra_params)
    @compra.precio_total=@compra.precio_unitario*@compra.cantidad_puntos
    if(@compra.save)
      @usuario=Usuario.find(@compra.usuario_id)
      @usuario.puntaje=u.puntaje+@compra.cantidad_puntos
      @usuario.save
      flash[:notice]="Compra Realizada"
      redirect_to usuario_path(@usuario)
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

  private

   def compra_params
      params.require(:compra).permit(:usuario_id, :precio_unitario, :precio_total, :cantidad_puntos)
   end

end
