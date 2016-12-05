class AddNumeroTarjetaToCompras < ActiveRecord::Migration
  def change
    add_column :compras, :numero_tarjeta, :string
  end
end
