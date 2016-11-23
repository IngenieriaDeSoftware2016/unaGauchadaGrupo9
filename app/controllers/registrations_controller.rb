class RegistrationsController < Devise::RegistrationsController

  public

  def create
    super
    if @usuario.imagen==""
      @usuario.imagen="http://www.cheap-accountants-in-london.co.uk/wp-content/uploads/2015/07/User-Avatar.png"
    end
    redirect_to usuario_path
  end

  private

  # my custom fields are :name, :heard_how
  def account_update_params
    allow = [:email, :password, :password_confirmation,:current_password, :nombre,:edad ,:rol,:telefono,:localidad,:puntaje,:imagen]
    params.require(resource_name).permit(allow)
  end

  def sign_up_params
    allow = [:email, :password, :password_confirmation, :nombre,:edad ,:rol,:telefono,:localidad,:puntaje,:imagen]
    params.require(resource_name).permit(allow)
  end



end
