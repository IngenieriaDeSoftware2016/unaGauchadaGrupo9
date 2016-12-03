class AgregarAtributosCompra < ActiveRecord::Migration
  def change
    add_column :compras, :vencimieto_tarjeta, :date
    add_column :compras, :numero_tarjeta, :integer
    add_column :compras, :cs_tarjeta, :integer
    add_column :compras, :nombre_t_tarjeta, :string
  end
end
