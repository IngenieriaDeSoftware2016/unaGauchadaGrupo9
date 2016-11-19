class MainsController < ApplicationController
  def index
  end

  def under_construction
  end

  def search
    if(params[:localidad]&&params[:palabra])
      @gauchadas=Gauchada.where("localidad ilike 'la Plata'").where("descripcion ilike ?", "%" + 'TEST' + "%")
    elsif(params[:localidad]&&!params[:palabra])
      @gauchadas=Gauchada.where("localidad ilike 'la Plata'")
    elsif(!params[:localidad]&&params[:palabra])
      @gauchadas=Gauchada.where("descripcion ilike ?", "%" + 'TEST' + "%")
    else
      @gauchadas=Gauchada.all
    end
  end

end
