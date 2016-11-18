class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    usuario = Usuario.new
    respond_with usuario
  end

  before_filter :configure_permitted_parameters

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:nombre,:edad ,:rol,:telefono,:localidad,:puntaje,
        :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:nombre,:edad ,:rol,:telefono,:localidad,:puntaje,
        :email, :password, :password_confirmation, :current_password)
    end
  end
  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, :nombre,:edad ,:rol,:telefono,:localidad,:puntaje]
    params.require(resource_name).permit(allow)
  end

end
