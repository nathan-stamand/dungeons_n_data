# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_23_194037) do

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "description"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "level"
    t.string "character_class"
    t.string "race"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "alignment"
    t.integer "max_hit_points"
    t.integer "current_hit_points"
    t.integer "damage"
    t.integer "campaign_id"
  end

  create_table "dnd_sessions", force: :cascade do |t|
    t.string "place"
    t.string "start_time"
    t.string "hours"
    t.integer "campaign_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "end_time"
    t.string "date"
    t.string "dm_notes"
  end

  create_table "player_campaigns", force: :cascade do |t|
    t.integer "user_id"
    t.integer "campaign_id"
    t.datetime "date_joined"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "uid"
  end

end
