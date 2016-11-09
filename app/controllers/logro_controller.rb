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
  end

end
