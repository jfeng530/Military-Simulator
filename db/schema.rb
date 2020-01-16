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

ActiveRecord::Schema.define(version: 2019_10_02_225552) do

  create_table "battles", force: :cascade do |t|
    t.integer "unit_id"
    t.integer "enemy_id"
    t.integer "unit_hp"
    t.integer "enemy_hp"
    t.string "winner"
    t.string "loser"
    t.string "unit_status"
    t.string "enemy_status"
    t.integer "unit_status_value"
    t.integer "enemy_status_value"
  end

  create_table "character_moves", force: :cascade do |t|
    t.integer "character_id"
    t.integer "move_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.string "info"
    t.integer "user_id"
    t.integer "element_id"
  end

  create_table "elements", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.string "info"
    t.string "sprite"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.string "info"
    t.integer "element_id"
    t.string "effect"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
  end

end
