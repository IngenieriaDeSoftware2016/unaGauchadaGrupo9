class UsuariosController < ApplicationController
  #before_filter :admin
  before_filter :is_admin, only: [:admin]

  def index
  end

  def show
    @usuario = Usuario.find(current_usuario.id)
<<<<<<< HEAD
    redirect_to (usuario_path)
=======
    redirect_to @usuario
>>>>>>> f4a0154ea3eb6e6c858b5af29edda67e13872f41
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


end
