class GauchadasController < ApplicationController
  skip_before_filter :authenticate_user!#, :only => :gauchadas_path
  def index

  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end

  def edit

  end
end
