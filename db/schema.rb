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

ActiveRecord::Schema.define(version: 20140710051532) do

  create_table "reportes", force: true do |t|
    t.string   "cedula"
    t.string   "nombre"
    t.string   "apellido1"
    t.string   "apellido2"
    t.string   "dependencia"
    t.string   "telefono"
    t.string   "asociado"
    t.string   "resultado"
    t.string   "referido"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "reportes", ["user_id"], name: "index_reportes_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "usuario"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nombres"
    t.string   "apellido1"
    t.string   "apellido2"
  end

end
