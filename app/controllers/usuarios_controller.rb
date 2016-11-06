class UsuariosController < ApplicationController

  def index
    if !session[:usuario_id]
      return '/'
    end
  end

  def show
    if !current_usuario.try(:admin?)
      return '/'
    end
  end

  def edit
  end

end
