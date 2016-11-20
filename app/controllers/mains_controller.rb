class MainsController < ApplicationController
  def index
  end

  def under_construction
  end

  def search
    if(params[:localidad]!=nil&&params[:palabra]!=nil)
      @gauchadas=Gauchada.where("localidad ilike ?", "%" + params[:localidad] + "%").where("descripcion ilike ?", "%" + params[:palabra] + "%")
    elsif(params[:localidad]&&!params[:palabra])
      @gauchadas=Gauchada.where("localidad ilike ?", "%" + params[:localidad] + "%")
    elsif(!params[:localidad]&&params[:palabra])
      palabras=params[:palabra].split(/\s* \s*/).map { |s| s.gsub(/[_%]/, '%' => '\\%', '_' => '\\_') }.map { |s| '%' + s + '%' }
      p=palabras.split(/\s* \s*/).map { |s| s.gsub(/[_%]/, '%' => '\\%', '_' => '\\_') }.map { |s| '%' + s + '%' }
      @gauchadas=Gauchada.where('descripcion ilike any(array[?])', p)
      #@gauchadas=Gauchada.where("descripcion ilike ?", "%" + palabras + "%")
    else
      @gauchadas=Gauchada.all
    end
  end

end
