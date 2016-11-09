class LogroController < ApplicationController
  def index
  end

  def new
  end

  def edit
    @logro = Logro.find(params[:id])
    if @logro == nil
      flash[:notice]="Logro inexistente"
      redirect_to '/'
    end
  end

  def delete
  end

  def show

  end

  def update
    @logro = Logro.find(params[:id])
    if @logro.update_attributes(logro_params)
      # Handle a successful update.
    else
      rend
  end

end
