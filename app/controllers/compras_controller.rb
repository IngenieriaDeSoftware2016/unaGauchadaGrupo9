  class ComprasController < ApplicationController
  def index
  end

  def reporte
    if(!current_usuario.nil?)
      if(current_usuario.admin)
        @compras=Compra.where(created_at: Date.yesterday..Date.tomorrow)
        @compras=Compra.where(created_at: Date.new(params[:inicio]['(1i)'].to_i,params[:inicio]['(2i)'].to_i,params[:inicio]['(3i)'].to_i)..Date.new(params[:fin]['(1i)'].to_i,params[:fin]['(2i)'].to_i,params[:fin]['(3i)'].to_i))
      else
        flash[:error]="Acceso denegado"
        redirect_to root_path
      end
    end
  end

  def show
    @compra = Compra.find(current_usuario.id)
  end

  def create
    @compra = Compra.new(compra_params)
    @compra.precio_total=@compra.precio_unitario*@compra.cantidad_puntos
    if(@compra.save)
      @usuario=Usuario.find(@compra.usuario_id)
      @usuario.puntaje=@usuario.puntaje+@compra.cantidad_puntos
      @usuario.save
      flash[:notice]="Compra Realizada"
      redirect_to usuario_path(@usuario)
    else
      message=""
      @compra.errors.full_messages.each do |msg|
        message=message+msg+"\n"
      end
      flash[:error]=message
      redirect_to :back
    end
  end

  def new
    @compra = Compra.new
  end

  def edit
    @compra = Compra.find(params[:id])
  end


  def ganancias
    if(!current_usuario.nil?)
      if(!current_usuario.admin)
        flash[:error]="Acceso denegado"
        redirect_to root_path
      end
    end
  end

  private

   def compra_params
      params.require(:compra).permit(:usuario_id, :precio_unitario, :precio_total, :cantidad_puntos, :vencimieto_tarjeta, :numero_tarjeta, :cs_tarjeta, :nombre_t_tarjeta)
   end

end
