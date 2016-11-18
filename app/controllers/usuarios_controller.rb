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

  def default

  end

  def create
    redirect_to logros_path(1)
  end

end
