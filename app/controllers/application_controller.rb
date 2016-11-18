class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_usuario!, :except => [:index]

  def after_sign_in_path_for(resource_or_scope)
    if current_usuario.admin
       return '/logros'
     else
       return '/gauchadas'
    end
  end

  def after_sign_out_path_for(resource_or_scope)
    return '/usuarios/sign_in'
  end
end
