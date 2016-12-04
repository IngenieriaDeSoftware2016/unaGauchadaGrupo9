class ChangeNumeroTarjetaFormat5InCompras < ActiveRecord::Migration
  def down
      remove_column :compras, :numero_tarjeta
  end
  def up
      add_column :compras, :numero_tarjeta,:bigint
  end
end
