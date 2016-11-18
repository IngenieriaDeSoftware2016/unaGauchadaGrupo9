class AddNombreToGauchadas < ActiveRecord::Migration
  def change
    add_column :gauchadas, :nombre, :string
  end
end
