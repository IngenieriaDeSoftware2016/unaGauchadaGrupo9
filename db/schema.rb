# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20161106163930) do
=======
ActiveRecord::Schema.define(version: 20161106220615) do
>>>>>>> develop

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

<<<<<<< HEAD
  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
=======
  create_table "gauchadas", force: :cascade do |t|
    t.integer  "id_creador"
    t.string   "descripcion"
    t.datetime "creacion"
    t.datetime "vencimiento"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "logros", force: :cascade do |t|
    t.integer  "puntaje"
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                              default: "",    null: false
    t.string   "encrypted_password",                 default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,     null: false
>>>>>>> develop
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "nombre",                 limit: 255
<<<<<<< HEAD
    t.string   "rol",                    limit: 50
=======
>>>>>>> develop
    t.integer  "edad"
    t.string   "localidad",              limit: 255
    t.integer  "puntaje"
    t.string   "telefono",               limit: 255
<<<<<<< HEAD
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
=======
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "admin",                              default: false
>>>>>>> develop
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
