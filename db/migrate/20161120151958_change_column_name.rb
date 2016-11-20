class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :postulantes, :id_gauchada, :gauchada_id
  end
end
