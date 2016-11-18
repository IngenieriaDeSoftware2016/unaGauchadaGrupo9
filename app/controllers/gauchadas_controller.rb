class GauchadasController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index

  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end
end
