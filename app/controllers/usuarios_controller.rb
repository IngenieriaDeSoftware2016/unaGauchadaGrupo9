class UsuariosController < ApplicationController
<<<<<<< HEAD
  
  def index
  end

  def show
=======

  def index
    if !session[:usuario_id]
      return '/'
    end
  end

  def show
    if !current_usuario.try(:admin?)
      return '/'
    end
>>>>>>> develop
  end

  def edit
  end

end
