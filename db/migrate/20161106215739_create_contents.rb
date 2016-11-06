class CreateContents < ActiveRecord::Migration
  def change
    create_table :logros do |t|
      t.integer :puntaje
      t.string :nombre
      t.timestamps null: false
    end
  end
end
