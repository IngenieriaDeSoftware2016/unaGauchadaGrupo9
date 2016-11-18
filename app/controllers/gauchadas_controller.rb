class GauchadasController < ApplicationController
  before_filter :require_no_authentication, only: :show
  def index

  end

  def show
    @gauchada = Gauchada.find(params[:id])
  end

  def edit

  end
end
