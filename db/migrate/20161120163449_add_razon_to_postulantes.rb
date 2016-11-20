class AddRazonToPostulantes < ActiveRecord::Migration
  def change
    add_column :postulantes, :razon, :string
  end
end
