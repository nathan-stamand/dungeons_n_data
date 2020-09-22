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

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "campaigns", force: :cascade do |t|
    t.text "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.text "description"
  end

  create_table "characters", force: :cascade do |t|
    t.text "name"
    t.integer "level"
    t.text "character_class"
    t.text "race"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.text "alignment"
    t.integer "max_hit_points"
    t.integer "current_hit_points"
    t.integer "damage"
    t.integer "campaign_id"
  end

  create_table "dnd_sessions", force: :cascade do |t|
    t.text "place"
    t.text "start_time"
    t.text "hours"
    t.integer "campaign_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "end_time"
    t.text "date"
    t.text "dm_notes"
  end

  create_table "player_campaigns", force: :cascade do |t|
    t.integer "user_id"
    t.integer "campaign_id"
    t.datetime "date_joined"
  end

  create_table "users", force: :cascade do |t|
    t.text "username"
    t.text "password_digest"
    t.text "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "uid"
  end

end
