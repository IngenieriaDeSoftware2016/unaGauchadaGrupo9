class AddLocalidadToGauchadas < ActiveRecord::Migration
  def change
    add_column :gauchadas, :localidad, :string
  end
end
