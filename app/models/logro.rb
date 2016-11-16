class Logro < ActiveRecord::Base
    validates :puntaje, uniqueness: true
    validates :nombre, uniqueness: true
end
