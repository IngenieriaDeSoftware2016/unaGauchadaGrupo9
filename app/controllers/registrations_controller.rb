class RegistrationsController < Devise::RegistrationsController

  private

  # my custom fields are :name, :heard_how
  def account_update_params
    allow = [:email, :password, :password_confirmation,:current_password, :nombre,:edad ,:rol,:telefono,:localidad,:puntaje]
    params.require(resource_name).permit(allow)
  end

  def sign_up_params
    allow = [:email, :password, :password_confirmation, :nombre,:edad ,:rol,:telefono,:localidad,:puntaje]
    params.require(resource_name).permit(allow)
  end

end
