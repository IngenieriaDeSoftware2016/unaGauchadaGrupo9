class Compra < ActiveRecord::Base
  belongs_to :usuario

  validates :numero_tarjeta, :presence => true,
                    :length => { :minimum => 16,:maximum => 16 }
  validates :cs_tarjeta, :presence => true,
                    :length => { :minimum => 3 ,:maximum => 3}

end
