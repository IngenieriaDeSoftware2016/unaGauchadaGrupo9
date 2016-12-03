class GauchadasController < ApplicationController
  skip_before_action :authenticate_usuario!, :except => :gauchada_edit_path#, :only => :gauchadas_path
  #skip_before_filter :authenticate_usuario!, :only => :show
  #before_filter      :authenticate_usuario!, :only => :show
  def index
    @gauchadas=Gauchada.order('created_at DESC')
  end

  def show
    @gauchada = Gauchada.find(params[:id])
    @comentarios=@gauchada.comentarios
  end


  def misgauchadascompletadas
    @postulaciones=current_usuario.postulantes.where(estado: true)
    @gauchadas=Set.new
    @postulaciones.each do |p|
      if(p.gauchada.estado=="finalizada" && p.estado==true)
        @gauchadas.add(p.gauchada)
      end
    end
    if(@gauchadas.empty?)
      flash[:alert]="Usted no ha completado ninguna gauchada"
      redirect_to root_path
    end
  end

  def positivo
    @gauchada=Gauchada.find(params[:id])
    @gauchada.estado="finalizada"
    @gauchada.save
    @usuario=@gauchada.postulantes.where(estado: :true).first.usuario
    @usuario.puntaje=@usuario.puntaje+1
    @usuario.save
    flash[:notice]="Gauchada marcada como resuelta"
    redirect_to gauchada_path(@gauchada)
  end

  def negativo
    @gauchada=Gauchada.find(params[:id])
    @gauchada.estado="finalizada"
    @gauchada.save
    @usuario=@gauchada.postulantes.where(estado: :true).first.usuario
    @usuario.puntaje=@usuario.puntaje-2
    @usuario.save
    flash[:notice]="Gauchada marcada como resuelta"
    redirect_to gauchada_path(@gauchada)
  end

  def rechazar
    @gauchada=Gauchada.find(params[:id])
    @usuario=@gauchada.postulantes.where(estado: :true).first.usuario
    @postulante=@gauchada.postulantes.where(estado: :true).first
    @postulante.delete
    @usuario.puntaje=@usuario.puntaje-2
    @usuario.save
    @gauchada.estado="libre"
    @gauchada.save
    flash[:notice]="La gauchada vuelve a estar abierta a postulaciones"
    redirect_to gauchada_path(@gauchada)
  end

  def edit
    @gauchada = Gauchada.find(params[:id])
    if current_usuario.nil?
      flash[:alert]="Acceso denegado"
      redirect_to new_usuario_session_path
    else
      if(@gauchada.usuario_id!=current_usuario.id)
        flash[:alert]="Usted no tiene permisos para editar esta gauchada"
        redirect_to gauchada_path(@gauchada)
      elsif(@gauchada.estado=="en proceso")
        flash[:alert]="No puede editarse una gauchada en proceso"
        redirect_to gauchada_path(@gauchada)
      end
    end
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
