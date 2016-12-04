class Compra < ActiveRecord::Base
  belongs_to :usuario

  validates :numero_trajeta, :presence => true,
                    :length => { :minimum => 16 }
  validates :cs_trajeta, :presence => true,
                    :length => { :minimum => 3 }

end
