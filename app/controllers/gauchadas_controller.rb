class GauchadasController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  def index

  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end
end
