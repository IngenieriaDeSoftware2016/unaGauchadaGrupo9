class ChangeNumeroTarjetaFormat5InCompras < ActiveRecord::Migration
  def up
      add_column :compras, :numero_tarjeta,:bigint
  end
  def down
      remove_column :compras, :numero_tarjeta
  end
end
