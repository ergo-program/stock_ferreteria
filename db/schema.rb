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

ActiveRecord::Schema.define(version: 20160604003336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "d_movements", force: :cascade do |t|
    t.integer  "movement_id"
    t.integer  "product_id"
    t.integer  "cantidad"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.decimal  "precio"
  end

  add_index "d_movements", ["movement_id"], name: "index_d_movements_on_movement_id", using: :btree
  add_index "d_movements", ["product_id"], name: "index_d_movements_on_product_id", using: :btree

  create_table "motives", force: :cascade do |t|
    t.string   "descripcion"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "movements", force: :cascade do |t|
    t.date     "fecha"
    t.integer  "motive_id"
    t.string   "tipo"
    t.integer  "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "movements", ["motive_id"], name: "index_movements_on_motive_id", using: :btree
  add_index "movements", ["person_id"], name: "index_movements_on_person_id", using: :btree

  create_table "parameters", force: :cascade do |t|
    t.string   "nombre"
    t.string   "direccion"
    t.string   "telefono"
    t.string   "email"
    t.string   "imagen"
    t.integer  "tiempo_espera"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "nombre"
    t.string   "telefono"
    t.string   "direccion"
    t.string   "documento"
    t.string   "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "unidad_medida"
    t.decimal  "costo"
    t.decimal  "precio_venta"
    t.integer  "cantidad"
    t.integer  "canitdad_min"
    t.integer  "brand_id"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  add_foreign_key "d_movements", "movements"
  add_foreign_key "d_movements", "products"
  add_foreign_key "movements", "motives"
  add_foreign_key "movements", "people"
  add_foreign_key "products", "brands"
  add_foreign_key "products", "categories"
end
