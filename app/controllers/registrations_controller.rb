class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    usuario = Usuario.new
    respond_with usuario
  end

  def create
    super
  end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, :nombre,:edad ,:rol,:telefono,:localidad,:puntaje]
    params.require(resource_name).permit(allow)
  end

end
