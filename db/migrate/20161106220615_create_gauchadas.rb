class CreateGauchadas < ActiveRecord::Migration
  def change
    create_table :gauchadas do |t|
      t.integer :id_creador
      t.string :descripcion
      t.datetime :creacion
      t.datetime :vencimiento

      t.timestamps null: false
    end
  end
end
