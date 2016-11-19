class MainsController < ApplicationController
  def index
  end

  def under_construction
  end

  def search
    if(params[:localidad]&&params[:palabra])
      @gauchadas=Gauchada.where("localidad ilike ?", "%" + params[:localidad] + "%").where("descripcion ilike ?", "%" + params[:palabra] + "%")
    elsif(params[:localidad]&&!params[:palabra])
      @gauchadas=Gauchada.where("localidad ilike ?", "%" + params[:localidad] + "%")
    elsif(!params[:localidad]&&params[:palabra])
      @gauchadas=Gauchada.where("descripcion ilike ?", "%" + params[:palabra] + "%")
    else
      @gauchadas=Gauchada.all
    end
  end

end
