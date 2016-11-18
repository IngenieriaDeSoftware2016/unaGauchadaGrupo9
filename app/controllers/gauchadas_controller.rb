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
         redirect_to gauchada_path(@gauchada)
       else
         message=""
         @logro.errors.full_messages.each do |msg|
           message=message+msg+"\n"
         end
         flash[:error]=message
         #flash[:error]= @logro.errors.full_messages.to_sentence
       end
       redirect_to root_path
  end

private

 def gauchada_params
    params.require(:gauchada).permit(:nombre, :descripcion, :localidad, :vencimiento)
 end
end
