class AddEstadoToGauchadas < ActiveRecord::Migration
  def change
    add_column :gauchadas, :estado, :string, default: "libre"
  end
end
