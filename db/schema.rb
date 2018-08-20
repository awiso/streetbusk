ActiveRecord::Schema.define(version: 2018_08_20_150655) do

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
    t.string "avatar"
    t.string "name"
    t.boolean "artist"
    t.string "astist_name"
    t.string "default_performance_photo"
    t.text "social_media_links"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "artist_genres", "genres"
  add_foreign_key "artist_genres", "users"
  add_foreign_key "performances", "genres"
  add_foreign_key "performances", "users"
end
