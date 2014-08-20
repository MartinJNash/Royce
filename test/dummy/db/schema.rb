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

ActiveRecord::Schema.define(version: 20140820071323) do

  create_table "roller_connector", force: true do |t|
    t.integer "roleable_id",   null: false
    t.string  "roleable_type", null: false
    t.integer "role_id",       null: false
  end

  add_index "roller_connector", ["role_id"], name: "index_roller_connector_on_role_id"
  add_index "roller_connector", ["roleable_id", "roleable_type"], name: "index_roller_connector_on_roleable_id_and_roleable_type"

  create_table "roller_role", force: true do |t|
    t.string   "type"
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roller_role", ["name"], name: "index_roller_role_on_name"

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
