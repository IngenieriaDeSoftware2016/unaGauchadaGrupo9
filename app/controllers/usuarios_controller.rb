class UsuariosController < ApplicationController
  #before_filter :admin
  before_filter :is_admin, only: [:admin]

  def index
  end

  def show
    @usuario = Usuario.find(current_usuario.id)
    @logro=Logro.find(1)
    Logro.all.each do |l|
      if(@usuario.puntaje>=l.puntaje)
        if(l.puntaje>@logro.puntaje)
          @logro=l
        end
      end
    end
  end

  def edit
  end

  def ranking
    if(!current_usuario.nil?)
      if(current_usuario.admin)
        @usuarios=Usuario.order(puntaje: :desc)
      else
        flash[:error]="Acceso denegado"
        redirect_to root_path
      end
    end
  end

  def misgauchadas
    @gauchadas=current_usuario.gauchadas
  end

  def admin
    #redirect_to "/", notice: 'You dont have enough permissions to be here' unless current_usuario.admin?
    #unless current_usuario.admin?
    #  redirect_to new_usuario_session_path, :alert => "Access denied."
    #end
  end

  def default

  end


end
