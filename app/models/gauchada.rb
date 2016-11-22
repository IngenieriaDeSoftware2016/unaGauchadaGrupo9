class Gauchada < ActiveRecord::Base

  belongs_to :usuario
  has_many :postulantes
  validates_datetime :vencimiento, :after => :creacion {message: ":Fecha invalida"}
end
