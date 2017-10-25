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

ActiveRecord::Schema.define(version: 20171025141714) do

  create_table "advisings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "candidate_id"
    t.integer  "poll_id"
    t.integer  "judgement_id"
    t.text     "comment",      limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "submitted"
    t.integer  "peer_id"
    t.index ["candidate_id"], name: "index_advisings_on_candidate_id", using: :btree
    t.index ["judgement_id"], name: "index_advisings_on_judgement_id", using: :btree
    t.index ["peer_id"], name: "index_advisings_on_peer_id", using: :btree
    t.index ["poll_id"], name: "index_advisings_on_poll_id", using: :btree
  end

  create_table "advocacies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "candidate_id"
    t.boolean  "apprenticeship"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "peer_id"
    t.index ["candidate_id"], name: "index_advocacies_on_candidate_id", using: :btree
    t.index ["peer_id"], name: "index_advocacies_on_peer_id", using: :btree
    t.index ["user_id"], name: "index_advocacies_on_user_id", using: :btree
  end

  create_table "candidates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "sca_name"
    t.boolean  "vote"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.integer  "group_id"
    t.string   "specialty_detail"
    t.index ["group_id"], name: "index_candidates_on_group_id", using: :btree
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "candidate_id"
    t.text     "text",         limit: 65535
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "peer_id"
    t.index ["candidate_id"], name: "index_comments_on_candidate_id", using: :btree
    t.index ["peer_id"], name: "index_comments_on_peer_id", using: :btree
  end

  create_table "dependencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "peer_id"
    t.integer  "superior_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["peer_id", "superior_id"], name: "index_dependencies_on_peer_id_and_superior_id", unique: true, using: :btree
    t.index ["peer_id"], name: "index_dependencies_on_peer_id", using: :btree
    t.index ["superior_id"], name: "index_dependencies_on_superior_id", using: :btree
  end

  create_table "group_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.integer  "group_type_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["group_type_id"], name: "index_groups_on_group_type_id", using: :btree
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "candidate_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["candidate_id"], name: "index_images_on_candidate_id", using: :btree
  end

  create_table "judgements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "peers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "elevated_by"
    t.boolean  "active"
    t.boolean  "vigilant"
    t.date     "elevation_date"
    t.text     "bio",                      limit: 65535
    t.string   "profile_pic_file_name"
    t.string   "profile_pic_content_type"
    t.integer  "profile_pic_file_size"
    t.datetime "profile_pic_updated_at"
    t.string   "apprenticed_to"
    t.boolean  "admin"
    t.string   "specialty_detail"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_peers_on_user_id", using: :btree
  end

  create_table "poll_results", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "candidate_id"
    t.integer  "poll_id"
    t.integer  "drop"
    t.integer  "no_strong_opinion"
    t.integer  "wait"
    t.integer  "elevate"
    t.float    "rec",               limit: 24
    t.float    "fav",               limit: 24
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["candidate_id"], name: "index_poll_results_on_candidate_id", using: :btree
    t.index ["poll_id"], name: "index_poll_results_on_poll_id", using: :btree
  end

  create_table "polls", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specializations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "specialty_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "candidate_id"
    t.integer  "peer_id"
    t.index ["candidate_id"], name: "index_specializations_on_candidate_id", using: :btree
    t.index ["peer_id"], name: "index_specializations_on_peer_id", using: :btree
    t.index ["specialty_id"], name: "index_specializations_on_specialty_id", using: :btree
    t.index ["user_id"], name: "index_specializations_on_user_id", using: :btree
  end

  create_table "specialties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "sca_name"
    t.string   "modern_name"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.boolean  "deceased"
    t.string   "arms_file_name"
    t.string   "arms_content_type"
    t.integer  "arms_file_size"
    t.datetime "arms_updated_at"
    t.integer  "group_id"
    t.string   "slug"
    t.boolean  "royalty"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["group_id"], name: "index_users_on_group_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "advisings", "candidates"
  add_foreign_key "advisings", "judgements"
  add_foreign_key "advisings", "peers"
  add_foreign_key "advisings", "polls"
  add_foreign_key "advocacies", "candidates"
  add_foreign_key "advocacies", "peers"
  add_foreign_key "advocacies", "users"
  add_foreign_key "candidates", "groups"
  add_foreign_key "comments", "candidates"
  add_foreign_key "comments", "peers"
  add_foreign_key "dependencies", "peers"
  add_foreign_key "dependencies", "peers", column: "superior_id"
  add_foreign_key "groups", "group_types"
  add_foreign_key "images", "candidates"
  add_foreign_key "peers", "users"
  add_foreign_key "poll_results", "candidates"
  add_foreign_key "poll_results", "polls"
  add_foreign_key "specializations", "candidates"
  add_foreign_key "specializations", "peers"
  add_foreign_key "specializations", "specialties"
  add_foreign_key "specializations", "users"
  add_foreign_key "users", "groups"
end
