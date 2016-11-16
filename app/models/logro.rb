class Logro < ActiveRecord::Base
    validates :puntaje, uniqueness: true
    validates :nombre, uniqueness: {message: "El nombre seleccionado ya existe"}
end
