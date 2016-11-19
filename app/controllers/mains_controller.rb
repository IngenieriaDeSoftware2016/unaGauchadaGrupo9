class MainsController < ApplicationController
  def index
  end

  def under_construction
  end

  def search
    @gauchadas.filtered_by_key_word(:palabra).filtered_by_localidad(:localidad);
    
  end

  private
  def self.filtered_by_key_word(opts = {})
     gauchada = Gauchada.arel_table
     if params[:palabra]
       self.where("descripcion like '?%' ", params[:palabra])
     else
       self.all
     end
   end
   def self.filtered_by_localidad(opts = {})
     gauchada = Gauchada.arel_table
     if params[:localidad]
       self.where("descripcion like '?%' ", params[:localidad])
     else
       self.all
     end
    end

end
