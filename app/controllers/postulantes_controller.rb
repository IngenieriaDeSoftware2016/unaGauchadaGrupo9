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
    @postulante = Postulantes.find(params[:id])
    @postulante.estado=true
    #Gauchada.find(@postulante.gauchada_id).estado="en proceso"
    redirect_to gauchada_path(@postulante.gauchada_id)
  end

  def index

  end


  def show

  end
  private

   def postulante_params
      params.require(:postulante).permit(:usuario_id, :gauchada_id, :razon, :estado)
   end

end
