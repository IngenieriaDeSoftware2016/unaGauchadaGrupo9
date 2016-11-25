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

ActiveRecord::Schema.define(version: 20161123213047) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comentarios", force: :cascade do |t|
    t.string   "contenido",     null: false
    t.integer  "usuario_id",    null: false
    t.integer  "gauchada_id",   null: false
    t.integer  "comentario_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.boolean  "pregunta"
  end

  create_table "compras", force: :cascade do |t|
    t.integer  "usuario_id"
    t.integer  "precio_unitario"
    t.integer  "precio_total"
    t.integer  "cantidad_puntos"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "gauchadas", force: :cascade do |t|
    t.integer  "usuario_id",                                                         null: false
    t.string   "descripcion",                                                        null: false
    t.string   "nombre",                                                             null: false
    t.datetime "creacion",                                                           null: false
    t.datetime "vencimiento",                                                        null: false
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "localidad",                                                          null: false
    t.string   "estado",      default: "libre"
    t.string   "imagen",      default: "https://s22.postimg.org/cs5ohupgx/logo.png"
  end

  create_table "logros", force: :cascade do |t|
    t.integer  "puntaje",    null: false
    t.string   "nombre",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "postulantes", force: :cascade do |t|
    t.integer  "usuario_id"
    t.boolean  "estado"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "gauchada_id"
    t.string   "razon"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "email",                              default: "",                                                                                        null: false
    t.string   "encrypted_password",                 default: "",                                                                                        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,                                                                                         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "nombre",                 limit: 255,                                                                                                     null: false
    t.boolean  "admin",                              default: false,                                                                                     null: false
    t.integer  "edad",                                                                                                                                   null: false
    t.string   "localidad",              limit: 255,                                                                                                     null: false
    t.integer  "puntaje",                            default: 1,                                                                                         null: false
    t.string   "telefono",               limit: 255,                                                                                                     null: false
    t.datetime "created_at",                                                                                                                             null: false
    t.datetime "updated_at",                                                                                                                             null: false
    t.string   "imagen",                             default: "http://www.cheap-accountants-in-london.co.uk/wp-content/uploads/2015/07/User-Avatar.png"
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true, using: :btree
  add_index "usuarios", ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true, using: :btree

end
