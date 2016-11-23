class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.string  :contenido, null: false
      t.integer :usuario_id, null: false
      t.integer :gauchada_id, null: false
      t.integer :comentario_id
      t.timestamps null: false
    end
  end
end
