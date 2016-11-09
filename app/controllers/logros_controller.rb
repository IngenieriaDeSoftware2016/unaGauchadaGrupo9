class LogrosController < ApplicationController
  def index
    @logros=Logro.all
  end

  def new
    @logro=Logro.new
  end

  def edit
    @logro = Logro.find(params[:id])
  end

  def destroy
    @logro=Logro.find(params[:id])
    @logro.destroy
    redirect_to usuarios_admin_path
  end

  def show
    @logro =  Logro.find(params[:id])

  end

  def create
       @logro = Logro.new(logro_params)
       @logro.save
       redirect_to logro_path(@logro)
   end

  def update
    @logro=Logro.find(params[:id])
    @logro.update(logro_params)
    #@logro = Logro.find(params[:id])
    #@logro.nombre=params[:nombre]
    #@logro.puntaje=params[:puntaje]
    #@logro.save
    #@logro.update(nombre: params[:nombre], puntaje: params[:puntaje])
    redirect_to logro_path(@logro)
  end

  private

   def logro_params
      params.require(:logro).permit(:nombre, :puntaje)
   end

end
