class RegistrationsController < Devise::RegistrationsController

  public

  #def edit
    #super()
    #redirect_to usuario_path
  #end

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
