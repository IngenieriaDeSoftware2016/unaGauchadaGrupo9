class ChangeNumeroTarjetaFormat3InCompras < ActiveRecord::Migration
  def change
    change_column :compras, :numero_tarjeta, :bigint
  end
end
