class MainsController < ApplicationController
  def index
  end

  def under_construction
  end

  def search
    @gauchadas.filtered;

  end

  private
  def self.filtered
     gauchada = Gauchada.arel_table
     if params[:palabra] && params[:localidad]
       self.where("descripcion like '?%' ", params[:palabra]).where("localidad like '?%' ", params[:localidad])
     elsif params[:palabra] && !params[:localidad]
       self.where("descripcion like '?%' ", params[:palabra])
     elsif !params[:palabra] && params[:localidad]
       self.where("localidad like '?%' ", params[:localidad])
     else
       self.all
     end
    end
end
