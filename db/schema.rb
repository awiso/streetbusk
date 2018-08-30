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

ActiveRecord::Schema.define(version: 2018_08_30_062238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_genres", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_artist_genres_on_genre_id"
    t.index ["user_id"], name: "index_artist_genres_on_user_id"
  end

  create_table "attendances", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "performance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_id"], name: "index_attendances_on_performance_id"
    t.index ["user_id"], name: "index_attendances_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "performance_id"
    t.text "comment_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["performance_id"], name: "index_comments_on_performance_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contributions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "artist_id"
    t.integer "price_cents", default: 0, null: false
    t.integer "amount_cents", default: 0, null: false
    t.string "state"
    t.jsonb "payment"
    t.text "message"
    t.index ["artist_id"], name: "index_contributions_on_artist_id"
    t.index ["user_id"], name: "index_contributions_on_user_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.string "performance_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "performances", force: :cascade do |t|
    t.bigint "user_id"
    t.string "location"
    t.datetime "start_time"
    t.datetime "end_time"
    t.text "description"
    t.bigint "genre_id"
    t.string "photo"
    t.integer "likes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["genre_id"], name: "index_performances_on_genre_id"
    t.index ["user_id"], name: "index_performances_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar", default: "https://res.cloudinary.com/dtczfskhf/image/upload/v1535063445/uos81zgosqzs3m2ua7q6.png"
    t.string "name"
    t.boolean "artist"
    t.string "artist_name"
    t.string "default_performance_photo", default: "https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?ixlib=rb-0.3.5&s=264727722bf2479d73380e1170bb3f48&auto=format&fit=crop&w=1050&q=80"
    t.string "soundcloud"
    t.string "youtube"
    t.string "artist_description"
    t.text "social_media_links"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artist_genres", "genres"
  add_foreign_key "artist_genres", "users"
  add_foreign_key "attendances", "performances"
  add_foreign_key "attendances", "users"
  add_foreign_key "comments", "performances"
  add_foreign_key "comments", "users"
  add_foreign_key "performances", "genres"
  add_foreign_key "performances", "users"
end
