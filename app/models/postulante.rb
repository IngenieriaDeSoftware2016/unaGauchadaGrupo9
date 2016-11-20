class Postulante < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :gauchada
end
