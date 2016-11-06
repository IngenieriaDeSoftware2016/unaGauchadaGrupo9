class DeviseCreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""


      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ##Datos base
      t.string   "nombre",      limit: 255
      #t.string   "password", limit: 255
      t.string   "rol", limit: 50
      t.integer   "edad"
      t.string   "localidad", limit: 255
      t.integer   "puntaje"
      #t.string   "email", limit: 255
      t.string   "telefono", limit: 255
      #t.datetime "created_at"
      #t.datetime "updated_at"

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :usuarios, :email,                unique: true
    add_index :usuarios, :reset_password_token, unique: true
    # add_index :usuarios, :confirmation_token,   unique: true
    # add_index :usuarios, :unlock_token,         unique: true
  end
end
