class ChangeNumeroTarjetaFormatInCompras < ActiveRecord::Migration
  def change
    change_column :compras, :numero_tarjeta, :bigint
  end
end
