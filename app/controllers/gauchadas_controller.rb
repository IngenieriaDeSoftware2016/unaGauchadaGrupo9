class GauchadasController < ApplicationController
  skip_before_action :authenticate_user!, :only => :gauchada_path
  skip_authorize_resource :only => :gauchada_path
  def index

  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end

  def edit

  end
end
