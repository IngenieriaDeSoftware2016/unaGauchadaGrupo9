class Logro < ActiveRecord::Base
    validates :puntaje, uniqueness: {message: ": El puntaje seleccionado para el logro ya existe"}
    validates :nombre, uniqueness: {message: ": El nombre seleccionado para el logro ya existe",:case_sensitive false}
end
