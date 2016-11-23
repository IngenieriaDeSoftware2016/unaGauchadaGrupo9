class MainsController < ApplicationController
  skip_before_action :authenticate_usuario!
  def index
  end

  def under_construction
  end

  def search
    if(params[:localidad]!=""&&params[:palabra]!="")
      palabras=params[:palabra].split(/\s* \s*/).map { |s| s.gsub(/[_%]/, '%' => '\\%', '_' => '\\_') }.map { |s| '%' + s + '%' }
      @gauchadas=Gauchada.where("localidad ilike ?", "%" + params[:localidad] + "%").where('descripcion ilike any(array[?])', palabras)
    elsif(params[:localidad]!=""&&params[:palabra]=="")
      @gauchadas=Gauchada.where("localidad ilike ?", "%" + params[:localidad] + "%")
    elsif(params[:localidad]==""&&params[:palabra]!="")
      palabras=params[:palabra].split(/\s* \s*/).map { |s| s.gsub(/[_%]/, '%' => '\\%', '_' => '\\_') }.map { |s| '%' + s + '%' }
      @gauchadas=Gauchada.where('descripcion ilike any(array[?])', palabras)
      #@gauchadas=Gauchada.where("descripcion ilike ?", "%" + palabras + "%")
    else
      @gauchadas=Gauchada.all
    end
  end

end
