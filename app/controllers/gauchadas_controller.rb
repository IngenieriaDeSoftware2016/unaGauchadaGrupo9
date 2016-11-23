class GauchadasController < ApplicationController
  skip_before_action :authenticate_usuario!#, :only => :gauchadas_path
  #skip_before_filter :authenticate_usuario!, :only => :show
  #before_filter      :authenticate_usuario!, :only => :show
  def index
    @gauchadas=Gauchada.order('created_at DESC')
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
        if(@gauchada.vencimiento<Time.now)
          @gauchada.vencimiento=5.days.from_now
          flash[:alert]="La fecha de vencimiento no puede ser menor a 5 dias desde su publicacion o modificacion.
           Se establece como fecha de vencimiento 5 dias a partir de hoy"
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
    if(@gauchada.usuario_id!=current_usuario.id)
      flash[:alert]="Usted no tiene permisos para editar esta gauchada"
    else
      if(@gauchada.estado=="en proceso")
        flash[:alert]="No puede editarse una gauchada en proceso"
      else
        if(@gauchada.update(gauchada_params))
          if @gauchada.imagen==""
            @gauchada.imagen="https://s22.postimg.org/cs5ohupgx/logo.png"
          end
          if(@gauchada.vencimiento<Time.now)
            @gauchada.vencimiento=5.days.from_now
            @gauchada.save
            flash[:alert]="La fecha de vencimiento no puede ser menor a 5 dias desde su publicacion o modificacion.
            Se establece como fecha de vencimiento 5 dias a partir de hoy"
         end
          flash[:notice]="Gauchada actualizado"
        else
          message=""
          @gauchada.errors.full_messages.each do |msg|
            message=message+msg+"\n"
          end
          flash[:error]=message
          #flash[:error]= @logro.errors.full_messages.to_sentence
        end
      end
    end
    redirect_to gauchada_path(@gauchada)
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
