class ChangeColumnNameCompras < ActiveRecord::Migration
  def change
    rename_column :compras, :id_usuario, :usuario_id
  end
end
