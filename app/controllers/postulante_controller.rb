class PostulanteController < ApplicationController

  def new

  end


  def create
      @postulante = @gauchada.postulante.create
      @postulante.usuario_id=current_usuario
      @postulante.estado=false
      if(@postulante.save)
        flash[:notice]="Te has postulado correctamente"
      else
        message=""
        @postulante.errors.full_messages.each do |msg|
          message=message+msg+"\n"
        end
        flash[:error]=message
      end
  end


  def edit

  end


  def index

  end


  def show

  end
end
