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


private

 def gauchada_params
    params.require(:gauchada).permit(:usuario_id, :creacion, :nombre, :descripcion, :localidad, :vencimiento)
 end

 def filtered
    gauchada = Gauchada.arel_table
    if params[:palabra] && params[:localidad]
      self.where("descripcion like '?%' ", params[:palabra]).where("localidad like '?%' ", params[:localidad])
    elsif params[:palabra] && !params[:localidad]
      self.where("descripcion like '?%' ", params[:palabra])
    elsif !params[:palabra] && params[:localidad]
      self.where("localidad like '?%' ", params[:localidad])
    else
      self.all
    end
   end
end
