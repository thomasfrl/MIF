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

ActiveRecord::Schema.define(version: 2019_03_20_163055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "quiz_conv_id"
    t.text "content"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_answers_on_author_id"
    t.index ["quiz_conv_id"], name: "index_answers_on_quiz_conv_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "zip_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "receiver_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["receiver_id"], name: "index_comments_on_receiver_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "iteration_quiz", default: 0.0
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "correspondances", force: :cascade do |t|
    t.bigint "creator_id"
    t.bigint "acceptor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "waiting"
    t.string "message"
    t.index ["acceptor_id"], name: "index_correspondances_on_acceptor_id"
    t.index ["creator_id"], name: "index_correspondances_on_creator_id"
  end

  create_table "flats", force: :cascade do |t|
    t.bigint "user_id"
    t.string "address"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place"
    t.string "room"
    t.string "sleep"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "languages", force: :cascade do |t|
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matchmaking_results", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "party_animal", default: 0
    t.integer "people_person", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_matchmaking_results_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "conversation_id"
    t.text "content"
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quiz_convs", force: :cascade do |t|
    t.bigint "quiz_id"
    t.bigint "conversation_id"
    t.integer "index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_quiz_convs_on_conversation_id"
    t.index ["quiz_id"], name: "index_quiz_convs_on_quiz_id"
  end

  create_table "quizzes", force: :cascade do |t|
    t.text "question"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testifies", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_testifies_on_user_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "object"
    t.string "category"
    t.text "content"
    t.bigint "user_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.bigint "correspondance_id"
    t.bigint "host_id"
    t.integer "duration"
    t.datetime "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "validated", default: false
    t.index ["correspondance_id"], name: "index_trips_on_correspondance_id"
    t.index ["host_id"], name: "index_trips_on_host_id"
  end

  create_table "user_languages", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "language_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["language_id"], name: "index_user_languages_on_language_id"
    t.index ["user_id"], name: "index_user_languages_on_user_id"
  end

  create_table "user_preferences", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "preference_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["preference_id"], name: "index_user_preferences_on_preference_id"
    t.index ["user_id"], name: "index_user_preferences_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.integer "age"
    t.text "welcome_message"
    t.string "nationality"
    t.bigint "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "user_name"
    t.boolean "is_admin", default: false
    t.string "status", default: "waiting"
    t.index ["city_id"], name: "index_users_on_city_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "quiz_convs"
  add_foreign_key "flats", "users"
  add_foreign_key "matchmaking_results", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "quiz_convs", "conversations"
  add_foreign_key "quiz_convs", "quizzes"
  add_foreign_key "testifies", "users"
  add_foreign_key "tickets", "users"
  add_foreign_key "trips", "correspondances"
  add_foreign_key "user_languages", "languages"
  add_foreign_key "user_languages", "users"
  add_foreign_key "user_preferences", "preferences"
  add_foreign_key "user_preferences", "users"
  add_foreign_key "users", "cities"
end
