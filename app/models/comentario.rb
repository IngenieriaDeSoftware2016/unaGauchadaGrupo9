class Comentario < ActiveRecord::Base
  belongs_to :usuario
  belongs_to :gauchada
  belongs_to :comentario
end
