class RemoveNumeroTarjetaFromCompras < ActiveRecord::Migration
  def up
    remove_column :compras, :numero_tarjeta, :string
  end
end
