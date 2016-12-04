class ChangeNumeroTarjetaFormat5InCompras < ActiveRecord::Migration
  def up
      add_column :compras, :numero_tarjeta,:bigint
  end
end
