class CreateCompras < ActiveRecord::Migration
  def change
    create_table :compras do |t|
      t.integer :id_usuario
      t.integer :precio_unitario
      t.integer :precio_total
      t.integer :cantidad_puntos

      t.timestamps null: false
    end
  end
end
