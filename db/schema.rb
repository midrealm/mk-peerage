# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_29_021148) do

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
    t.string "service_name", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "advisings", id: :serial, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "poll_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "peer_id"
    t.integer "judgement"
    t.index ["candidate_id"], name: "index_advisings_on_candidate_id"
    t.index ["peer_id"], name: "index_advisings_on_peer_id"
    t.index ["poll_id"], name: "index_advisings_on_poll_id"
  end

  create_table "advocacies", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "candidate_id"
    t.boolean "apprenticeship"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "peer_id"
    t.index ["candidate_id"], name: "index_advocacies_on_candidate_id"
    t.index ["peer_id"], name: "index_advocacies_on_peer_id"
    t.index ["user_id"], name: "index_advocacies_on_user_id"
  end

  create_table "ballots", force: :cascade do |t|
    t.bigint "peer_id"
    t.bigint "poll_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "seed"
    t.index ["peer_id"], name: "index_ballots_on_peer_id"
    t.index ["poll_id"], name: "index_ballots_on_poll_id"
  end

  create_table "candidates", id: :serial, force: :cascade do |t|
    t.string "sca_name"
    t.boolean "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "group_id"
    t.string "specialty_detail"
    t.integer "peerage_type"
    t.string "modern_name"
    t.index ["group_id"], name: "index_candidates_on_group_id"
  end

  create_table "comments", id: :serial, force: :cascade do |t|
    t.integer "candidate_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "peer_id"
    t.index ["candidate_id"], name: "index_comments_on_candidate_id"
    t.index ["peer_id"], name: "index_comments_on_peer_id"
  end

  create_table "dependencies", id: :serial, force: :cascade do |t|
    t.integer "peer_id"
    t.integer "superior_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["peer_id", "superior_id"], name: "index_dependencies_on_peer_id_and_superior_id", unique: true
    t.index ["peer_id"], name: "index_dependencies_on_peer_id"
    t.index ["superior_id"], name: "index_dependencies_on_superior_id"
  end

  create_table "documents", id: :serial, force: :cascade do |t|
    t.integer "peer_id"
    t.integer "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.index ["candidate_id"], name: "index_documents_on_candidate_id"
    t.index ["peer_id"], name: "index_documents_on_peer_id"
  end

  create_table "group_types", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "group_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.integer "ancestry_depth", default: 0
    t.string "slug"
    t.index ["ancestry"], name: "index_groups_on_ancestry"
    t.index ["group_type_id"], name: "index_groups_on_group_type_id"
  end

  create_table "news", force: :cascade do |t|
    t.integer "peerage_type"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peers", id: :serial, force: :cascade do |t|
    t.string "elevated_by"
    t.boolean "active"
    t.boolean "vigilant"
    t.date "elevation_date"
    t.text "bio"
    t.string "dependent_of"
    t.boolean "admin"
    t.string "specialty_detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "type"
    t.index ["user_id"], name: "index_peers_on_user_id"
  end

  create_table "poll_results", id: :serial, force: :cascade do |t|
    t.integer "candidate_id"
    t.integer "poll_id"
    t.integer "drop"
    t.integer "no_strong_opinion"
    t.integer "wait"
    t.integer "elevate"
    t.float "rec"
    t.float "fav"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_response"
    t.index ["candidate_id"], name: "index_poll_results_on_candidate_id"
    t.index ["poll_id"], name: "index_poll_results_on_poll_id"
  end

  create_table "polls", id: :serial, force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "peerage_type"
    t.boolean "published"
  end

  create_table "specializations", id: :serial, force: :cascade do |t|
    t.integer "specialty_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "candidate_id"
    t.integer "peer_id"
    t.index ["candidate_id"], name: "index_specializations_on_candidate_id"
    t.index ["peer_id"], name: "index_specializations_on_peer_id"
    t.index ["specialty_id"], name: "index_specializations_on_specialty_id"
  end

  create_table "specialties", id: :serial, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "peerage_type"
    t.string "slug"
    t.string "ancestry"
    t.index ["ancestry"], name: "index_specialties_on_ancestry"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sca_name"
    t.string "modern_name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.string "phone"
    t.boolean "deceased"
    t.integer "group_id"
    t.string "slug"
    t.boolean "royalty"
    t.boolean "has_logged_in"
    t.boolean "superuser"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["group_id"], name: "index_users_on_group_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "advisings", "candidates"
  add_foreign_key "advisings", "peers"
  add_foreign_key "advisings", "polls"
  add_foreign_key "advocacies", "candidates"
  add_foreign_key "advocacies", "peers"
  add_foreign_key "advocacies", "users"
  add_foreign_key "ballots", "peers"
  add_foreign_key "ballots", "polls"
  add_foreign_key "candidates", "groups"
  add_foreign_key "comments", "candidates"
  add_foreign_key "comments", "peers"
  add_foreign_key "dependencies", "peers"
  add_foreign_key "dependencies", "peers", column: "superior_id"
  add_foreign_key "documents", "candidates"
  add_foreign_key "documents", "peers"
  add_foreign_key "groups", "group_types"
  add_foreign_key "peers", "users"
  add_foreign_key "poll_results", "candidates"
  add_foreign_key "poll_results", "polls"
  add_foreign_key "specializations", "candidates"
  add_foreign_key "specializations", "peers"
  add_foreign_key "specializations", "specialties"
  add_foreign_key "users", "groups"
end
