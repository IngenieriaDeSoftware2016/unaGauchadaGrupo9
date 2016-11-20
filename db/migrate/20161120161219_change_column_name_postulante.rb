class ChangeColumnNamePostulante < ActiveRecord::Migration
  def change
    rename_column :postulantes, :id_usuario, :usuario_id
  end
end
