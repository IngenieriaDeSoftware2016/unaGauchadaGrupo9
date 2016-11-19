class CreatePostulantes < ActiveRecord::Migration
  def change
    create_table :postulantes do |t|
      t.integer :id_usuario
      t.boolean :estado
      
      t.timestamps null: false
    end
  end
end
