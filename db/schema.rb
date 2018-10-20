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

ActiveRecord::Schema.define(version: 2018_10_20_163239) do

  create_table "materials", force: :cascade do |t|
    t.string "material_name"
    t.boolean "tool", default: false
    t.boolean "raw_materials", default: false
  end

  create_table "project_materials", force: :cascade do |t|
    t.integer "project_id"
    t.integer "material_id"
    t.integer "quantity"
    t.string "size"
    t.index ["material_id"], name: "index_project_materials_on_material_id"
    t.index ["project_id"], name: "index_project_materials_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.integer "difficulty"
    t.string "project_type"
    t.integer "user_id"
    t.string "instructions"
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "name"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "material_id"
    t.string "buy"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
  end

end
