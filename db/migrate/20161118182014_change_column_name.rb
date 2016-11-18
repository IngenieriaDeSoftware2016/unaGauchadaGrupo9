class ChangeColumnName < ActiveRecord::Migration
  def change
      rename_column :gauchadas, :id_creador, :usuario_id
  end
end
