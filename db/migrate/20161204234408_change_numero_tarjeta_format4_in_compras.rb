class ChangeNumeroTarjetaFormat4InCompras < ActiveRecord::Migration
  def change
    change_column :compras, :numero_tarjeta,'bigint USING CAST(column_name AS integer)'
  end
end
