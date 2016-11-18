class UsuariosController < ApplicationController
  #before_filter :admin
  before_filter :is_admin, only: [:admin]

  def index
  end

  def show

  end

  def edit
  end

  def admin
    #redirect_to "/", notice: 'You dont have enough permissions to be here' unless current_usuario.admin?
    #unless current_usuario.admin?
    #  redirect_to new_usuario_session_path, :alert => "Access denied."
    #end
  end

  def is_admin
    if !current_usuario.admin?
      flash[:alert]="Acceso denegado"
      redirect_to gauchadas_path
    end
    redirect_to logros_path
    #redirect_to "/", alert: 'You dont have enough permissions to be here' unless current_usuario.admin?
  end

  def default

  end

end
