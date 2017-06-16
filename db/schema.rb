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

ActiveRecord::Schema.define(version: 20170615200848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "almacen", primary_key: "cod_almacen", force: :cascade do |t|
    t.string  "nom_almacen", limit: 35
    t.string  "dir_almacen", limit: 45
    t.integer "tel_almacen"
  end

  add_index "almacen", ["cod_almacen"], name: "almacen_pk", unique: true, using: :btree

  create_table "almacens", force: :cascade do |t|
    t.integer  "COD_ALMACEN"
    t.string   "NOM_ALMACEN"
    t.string   "DIR_ALMACEN"
    t.integer  "TEL_ALMACEN"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categoria", primary_key: "cod_categoria", force: :cascade do |t|
    t.string "nom_categoria", limit: 35
  end

  add_index "categoria", ["cod_categoria"], name: "categoria_pk", unique: true, using: :btree

  create_table "ciudad", primary_key: "cod_ciudad", force: :cascade do |t|
    t.integer "cod_pais",              null: false
    t.string  "nom_ciudad", limit: 25
  end

  add_index "ciudad", ["cod_ciudad"], name: "ciudad_pk", unique: true, using: :btree
  add_index "ciudad", ["cod_pais"], name: "pertenece_fk", using: :btree

  create_table "cliente", primary_key: "cod_cliente", force: :cascade do |t|
    t.string  "nom_cliente", limit: 35
    t.string  "dir_cliente", limit: 45
    t.integer "tel_cliente"
  end

  create_table "cotizacion", primary_key: "cod_cotiza", force: :cascade do |t|
    t.integer "cod_cliente",     null: false
    t.integer "canti_productos"
  end

  add_index "cotizacion", ["cod_cotiza"], name: "cotizacion_pk", unique: true, using: :btree

  create_table "detalle_pedido", primary_key: "cod_detalle", force: :cascade do |t|
    t.integer "cod_producto",   null: false
    t.integer "cantidad_venta"
  end

  add_index "detalle_pedido", ["cod_detalle"], name: "detalle_pedido_pk", unique: true, using: :btree
  add_index "detalle_pedido", ["cod_producto"], name: "vendido_fk", using: :btree

  create_table "documento", primary_key: "cod_documento", force: :cascade do |t|
    t.integer "cod_tipdoc",               null: false
    t.integer "cod_pedido",               null: false
    t.string  "nom_documento", limit: 35
    t.string  "ruta_archivo",  limit: 80
  end

  add_index "documento", ["cod_documento"], name: "documento_pk", unique: true, using: :btree
  add_index "documento", ["cod_pedido"], name: "posee_fk", using: :btree
  add_index "documento", ["cod_tipdoc"], name: "tipo_fk", using: :btree

  create_table "factura", primary_key: "cod_factura", force: :cascade do |t|
    t.integer "cod_pago",     null: false
    t.date    "fecha_venta"
    t.integer "cant_product"
  end

  add_index "factura", ["cod_factura"], name: "factura_pk", unique: true, using: :btree
  add_index "factura", ["cod_pago"], name: "puede_fk", using: :btree

  create_table "marca", primary_key: "cod_marca", force: :cascade do |t|
    t.string "nom_marca", limit: 35
  end

  add_index "marca", ["cod_marca"], name: "marca_pk", unique: true, using: :btree

  create_table "pais", primary_key: "cod_pais", force: :cascade do |t|
    t.string "nom_pais", limit: 40
  end

  add_index "pais", ["cod_pais"], name: "pais_pk", unique: true, using: :btree

  create_table "pedido", primary_key: "cod_pedido", force: :cascade do |t|
    t.integer "cod_factura",    null: false
    t.integer "cod_transporte", null: false
    t.integer "cod_cliente",    null: false
    t.date    "fecha_pedido"
  end

  add_index "pedido", ["cod_factura"], name: "depende_fk", using: :btree
  add_index "pedido", ["cod_pedido"], name: "pedido_pk", unique: true, using: :btree
  add_index "pedido", ["cod_transporte"], name: "encarga_fk", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prod_alma", primary_key: "cod_prod_alma", force: :cascade do |t|
    t.integer "cod_producto"
    t.integer "cod_almacen"
  end

  add_index "prod_alma", ["cod_almacen"], name: "estan2_fk", using: :btree
  add_index "prod_alma", ["cod_prod_alma"], name: "prod_alma_pk", unique: true, using: :btree
  add_index "prod_alma", ["cod_producto"], name: "estan1_fk", using: :btree

  create_table "prod_coti", primary_key: "cod_prod_coti", force: :cascade do |t|
    t.integer "cod_cotiza"
    t.integer "cod_producto"
  end

  add_index "prod_coti", ["cod_cotiza"], name: "realiza2_fk", using: :btree
  add_index "prod_coti", ["cod_prod_coti"], name: "prod_coti_pk", unique: true, using: :btree
  add_index "prod_coti", ["cod_producto"], name: "realiza1_fk", using: :btree

  create_table "producto", primary_key: "cod_producto", force: :cascade do |t|
    t.integer "cod_categoria",                                     null: false
    t.integer "cod_prov",                                          null: false
    t.integer "cod_marca",                                         null: false
    t.string  "nom_producto",  limit: 40
    t.decimal "precio_unit",              precision: 10, scale: 2
    t.integer "cantidad"
  end

  add_index "producto", ["cod_categoria"], name: "tiene_fk", using: :btree
  add_index "producto", ["cod_marca"], name: "produce_fk", using: :btree
  add_index "producto", ["cod_producto"], name: "producto_pk", unique: true, using: :btree
  add_index "producto", ["cod_prov"], name: "suministra_fk", using: :btree

  create_table "proveedor", primary_key: "cod_prov", force: :cascade do |t|
    t.integer "cod_ciudad",            null: false
    t.string  "nom_prov",   limit: 50
    t.string  "dir_prov",   limit: 35
    t.string  "tel_prov",   limit: 15
  end

  add_index "proveedor", ["cod_ciudad"], name: "situado_fk", using: :btree
  add_index "proveedor", ["cod_prov"], name: "proveedor_pk", unique: true, using: :btree

  create_table "proveedors", force: :cascade do |t|
    t.integer  "cod_prov"
    t.string   "nom_prov"
    t.string   "dir_prov"
    t.string   "tel_prov"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipo_documento", primary_key: "cod_tipdoc", force: :cascade do |t|
    t.string "nom_tipdoc", limit: 35
    t.string "formato",    limit: 4
  end

  add_index "tipo_documento", ["cod_tipdoc"], name: "tipo_documento_pk", unique: true, using: :btree

  create_table "tipo_pago", primary_key: "cod_pago", force: :cascade do |t|
    t.string "nom_pago", limit: 35
  end

  add_index "tipo_pago", ["cod_pago"], name: "tipo_pago_pk", unique: true, using: :btree

  create_table "tipo_transporte", primary_key: "cod_tiptrans", force: :cascade do |t|
    t.string "nom_tiptrans", limit: 35
  end

  add_index "tipo_transporte", ["cod_tiptrans"], name: "tipo_transporte_pk", unique: true, using: :btree

  create_table "transporte", primary_key: "cod_transporte", force: :cascade do |t|
    t.integer "cod_tiptrans",              null: false
    t.string  "nom_transporte", limit: 35
    t.date    "fecha_despacho"
  end

  add_index "transporte", ["cod_tiptrans"], name: "opera_fk", using: :btree
  add_index "transporte", ["cod_transporte"], name: "transporte_pk", unique: true, using: :btree

  add_foreign_key "ciudad", "pais", column: "cod_pais", primary_key: "cod_pais", name: "fk_ciudad_pertenece_pais", on_update: :restrict, on_delete: :restrict
  add_foreign_key "detalle_pedido", "producto", column: "cod_producto", primary_key: "cod_producto", name: "fk_detalle__vendido_producto", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento", "pedido", column: "cod_pedido", primary_key: "cod_pedido", name: "fk_document_posee_pedido", on_update: :restrict, on_delete: :restrict
  add_foreign_key "documento", "tipo_documento", column: "cod_tipdoc", primary_key: "cod_tipdoc", name: "fk_document_tipo_tipo_doc", on_update: :restrict, on_delete: :restrict
  add_foreign_key "factura", "tipo_pago", column: "cod_pago", primary_key: "cod_pago", name: "fk_factura_puede_tipo_pag", on_update: :restrict, on_delete: :restrict
  add_foreign_key "pedido", "factura", column: "cod_factura", primary_key: "cod_factura", name: "fk_pedido_depende_factura", on_update: :restrict, on_delete: :restrict
  add_foreign_key "pedido", "transporte", column: "cod_transporte", primary_key: "cod_transporte", name: "fk_pedido_encarga_transpor", on_update: :restrict, on_delete: :restrict
  add_foreign_key "prod_alma", "almacen", column: "cod_almacen", primary_key: "cod_almacen", name: "fk_prod_alm_estan2_almacen", on_update: :restrict, on_delete: :restrict
  add_foreign_key "prod_alma", "producto", column: "cod_producto", primary_key: "cod_producto", name: "fk_prod_alm_estan1_producto", on_update: :restrict, on_delete: :restrict
  add_foreign_key "prod_coti", "cotizacion", column: "cod_cotiza", primary_key: "cod_cotiza", name: "fk_prod_cot_realiza2_cotizaci", on_update: :restrict, on_delete: :restrict
  add_foreign_key "prod_coti", "producto", column: "cod_producto", primary_key: "cod_producto", name: "fk_prod_cot_realiza1_producto", on_update: :restrict, on_delete: :restrict
  add_foreign_key "producto", "categoria", column: "cod_categoria", primary_key: "cod_categoria", name: "fk_producto_tiene_categori", on_update: :restrict, on_delete: :restrict
  add_foreign_key "producto", "marca", column: "cod_marca", primary_key: "cod_marca", name: "fk_producto_produce_marca", on_update: :restrict, on_delete: :restrict
  add_foreign_key "producto", "proveedor", column: "cod_prov", primary_key: "cod_prov", name: "fk_producto_suministr_proveedo", on_update: :restrict, on_delete: :restrict
  add_foreign_key "proveedor", "ciudad", column: "cod_ciudad", primary_key: "cod_ciudad", name: "fk_proveedo_situado_ciudad", on_update: :restrict, on_delete: :restrict
  add_foreign_key "transporte", "tipo_transporte", column: "cod_tiptrans", primary_key: "cod_tiptrans", name: "fk_transpor_opera_tipo_tra", on_update: :restrict, on_delete: :restrict
end
