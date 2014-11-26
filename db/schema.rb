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

ActiveRecord::Schema.define(version: 20141125195814) do

  create_table "recursos", force: true do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recursos_users", id: false, force: true do |t|
    t.integer "recurso_id"
    t.integer "user_id"
    t.integer "cantidad",   default: 0
  end

  add_index "recursos_users", ["recurso_id"], name: "index_recursos_users_on_recurso_id"
  add_index "recursos_users", ["user_id"], name: "index_recursos_users_on_user_id"

  create_table "tropas", force: true do |t|
    t.string   "nombre"
    t.integer  "costo"
    t.integer  "ataque"
    t.integer  "defensa"
    t.text     "historia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "recurso"
  end

  create_table "tropas_users", id: false, force: true do |t|
    t.integer "tropa_id"
    t.integer "user_id"
  end

  add_index "tropas_users", ["tropa_id"], name: "index_tropas_users_on_tropa_id"
  add_index "tropas_users", ["user_id"], name: "index_tropas_users_on_user_id"

  create_table "users", force: true do |t|
    t.integer  "puntos_experiencia",     default: 0
    t.integer  "nivel",                  default: 1
    t.integer  "partidas_ganadas",       default: 0
    t.integer  "partidas_perdidas",      default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "email",                  default: "",        null: false
    t.string   "encrypted_password",     default: "",        null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,         null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "permiso",                default: "usuario"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
