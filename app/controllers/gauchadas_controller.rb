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

private

 def gauchada_params
    params.require(:gauchada).permit(:id_creador, :creacion, :nombre, :descripcion, :localidad, :vencimiento)
 end
end
