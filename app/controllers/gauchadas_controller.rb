class GauchadasController < ApplicationController
  skip_before_action :authenticate_user!, except: [:edit]
  def index

  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end

  def edit

  end
end
