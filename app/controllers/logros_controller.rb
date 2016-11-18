class LogrosController < ApplicationController
  before_filter :is_admin
  def index
    @logros=Logro.all
  end

  def new
    @logro=Logro.new
  end

  def edit
    @logro = Logro.find(params[:id])
    if @logro.nombre=="Politico"
      flash[:alert]="No puede editarse este logro"
      redirect_to :back
    end
  end

  def destroy
    @logro=Logro.find(params[:id])
    if @logro.nombre!="Politico"
      @logro.destroy
      redirect_to usuarios_admin_path
    else
      flash[:alert]="No puede borrarse este logro"
      redirect_to :back
    end
  end

  def show
    @logro =  Logro.find(params[:id])

  end

  def create
       @logro = Logro.new(logro_params)
       if(@logro.save)
         flash[:notice]="Logro guardado"
       else
         message=""
         @logro.errors.full_messages.each do |msg|
           message=message+msg+"\n"
         end
         flash[:error]=message
         #flash[:error]= @logro.errors.full_messages.to_sentence
       end
       redirect_to usuarios_admin_path
   end

  def update
    @logro=Logro.find(params[:id])
    if @logro.nombre!="Politico"
      if(@logro.update(logro_params))
        flash[:notice]="Logro actualizado"
      else
        message=""
        @logro.errors.full_messages.each do |msg|
          message=message+msg+"\n"
        end
        flash[:error]=message
        #flash[:error]= @logro.errors.full_messages.to_sentence
      end
      redirect_to usuarios_admin_path
    else
      redirect_to :back
    end
  end

  def is_admin
    if !current_usuario.admin?
      flash[:alert]="Acceso denegado"
      redirect_to gauchadas_path
    end
    redirect_to logros_path
    #redirect_to "/", alert: 'You dont have enough permissions to be here' unless current_usuario.admin?
  end

  private

   def logro_params
      params.require(:logro).permit(:nombre, :puntaje)
   end

end
