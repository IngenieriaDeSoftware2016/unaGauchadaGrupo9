class PostulantesController < ApplicationController

  def new
    @postulante=Postulante.new
  end


  def create
      @postulante = Postulante.new(postulante_params)
      if(@postulante.save)
        flash[:notice]="Te has postulado correctamente"
      else
        message=""
        @postulante.errors.full_messages.each do |msg|
          message=message+msg+"\n"
        end
        flash[:error]=message
      end
      redirect_to gauchada_path(Gauchada.find(@postulante.gauchada_id))
  end


  def edit

  end

  def aceptar
    @postulante = Postulante.find(params[:id])
    @postulante.estado=true
    @postulante.save
    @gauchada=Gauchada.find(@postulante.gauchada_id)
    @gauchada.estado="en proceso"
    @gauchada.save
    redirect_to gauchada_path(@postulante.gauchada_id)
  end

  def index

    @postulaciones_ganadas=current_usuario.postulantes.where(estado: true)
    @postulaciones=current_usuario.postulantes.where(estado: false)
    @postulaciones_activas=Set.new
    @postulaciones_finalizadas=Set.new

    @postulaciones.each do |p|
      if(p.gauchada.estado=="finalizada")
        @postulaciones_finalizadas.add(p)
      else
        @postulaciones_activas.add(p)
      end
    end
  end



  def show

  end
  private

   def postulante_params
      params.require(:postulante).permit(:usuario_id, :gauchada_id, :razon, :estado)
   end

end
