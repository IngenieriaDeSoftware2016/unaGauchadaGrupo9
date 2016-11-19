class AgregarIdGauchada < ActiveRecord::Migration
  def change
    add_column :postulantes, :id_gauchada, :integer
  end
end
