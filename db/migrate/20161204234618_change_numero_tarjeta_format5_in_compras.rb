class ChangeNumeroTarjetaFormat5InCompras < ActiveRecord::Migration
  def down
      remove_column :compras, :numero_tarjeta
  end
end
