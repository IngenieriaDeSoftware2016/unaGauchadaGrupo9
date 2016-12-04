class ChangeNumeroTarjetaFormat2InCompras < ActiveRecord::Migration
  def change
    change_column :compras, :numero_tarjeta, :string
  end
end
