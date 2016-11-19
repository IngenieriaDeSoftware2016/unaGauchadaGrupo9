class MainsController < ApplicationController
  def index
  end

  def under_construction
  end

  def search
    @gauchadas.filtered;
  end

  
end
