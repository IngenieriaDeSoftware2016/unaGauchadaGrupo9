class Gauchada < ActiveRecord::Base
  belongs_to :usuario
  has_many :postulantes
end
