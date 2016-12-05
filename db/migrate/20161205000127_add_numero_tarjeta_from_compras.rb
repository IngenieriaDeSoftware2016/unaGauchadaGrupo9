class AddNumeroTarjetaFromCompras < ActiveRecord::Migration
  def down
    add_column :compras, :numero_tarjeta, :bigint
  end
end
