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
       @gauchada = Gauchada.new(gauchada_params)
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
    redirect_to gauchada_path(24)
  end

  def postulacion
  respond_to do |format|
    format.html
    format.js
  end


end

private

 def gauchada_params
    params.require(:gauchada).permit(:usuario_id, :creacion, :nombre, :descripcion, :localidad, :vencimiento)
 end

end
