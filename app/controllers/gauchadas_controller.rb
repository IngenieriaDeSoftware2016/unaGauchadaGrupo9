class GauchadasController < ApplicationController
  skip_before_action :authenticate_usuario!#, :only => :gauchadas_path
  #skip_before_filter :authenticate_usuario!, :only => :show
  #before_filter      :authenticate_usuario!, :only => :show
  def index

  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end

  def edit
    @gauchada = Gauchada.find(params[:id])
  end

  def new
    @gauchada=Gauchada.new
  end

  def create
      if(current_usuario.puntaje>0)
        current_usuario.puntaje=current_usuario.puntaje-1
        current_usuario.save
        @gauchada = Gauchada.new(gauchada_params)
        if @gauchada.imagen==""
          @gauchada.imagen="https://s22.postimg.org/cs5ohupgx/logo.png"
        end
        if(@gauchada.save)
          flash[:notice]="Gauchada publicada"
        else
          message=""
          @gauchada.errors.full_messages.each do |msg|
            message=message+msg+"\n"
          end
          flash[:error]=message
        end
        redirect_to gauchada_path(@gauchada)
      else
        flash[:error]="No posee suficientes puntos para publicar una gauchada"
        redirect_to new_compra_path
      end
  end
  def update
    @gauchada=Gauchada.find(params[:id])
      if(@gauchada.update(gauchada_params))
        flash[:notice]="Gauchada actualizado"
      else
        message=""
        @gauchada.errors.full_messages.each do |msg|
          message=message+msg+"\n"
        end
        flash[:error]=message
        #flash[:error]= @logro.errors.full_messages.to_sentence
      end
      redirect_to gauchadas_path(@gauchada)
  end

  def postulantes
    @gauchada = Gauchada.find(params[:id])
    if (@gauchada.estado!="libre" || @gauchada.usuario_id!=current_usuario.id)
      flash[:error]="Acceso denegado"
      redirect_to gauchadas_path(@gauchada)
    end
  end

  def postulacion
  respond_to do |format|
    format.html
    format.js
  end


end

private

 def gauchada_params
    params.require(:gauchada).permit(:usuario_id, :creacion, :nombre, :descripcion, :localidad, :vencimiento,:imagen)
 end

end
