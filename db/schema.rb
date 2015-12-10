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

ActiveRecord::Schema.define(version: 20151209065441) do

  create_table "activities", force: :cascade do |t|
    t.integer  "trackable_id",   limit: 4
    t.string   "trackable_type", limit: 255
    t.integer  "owner_id",       limit: 4
    t.string   "owner_type",     limit: 255
    t.string   "key",            limit: 255
    t.text     "parameters",     limit: 65535
    t.integer  "recipient_id",   limit: 4
    t.string   "recipient_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string   "file",            limit: 255
    t.string   "attachable_type", limit: 255
    t.integer  "attachable_id",   limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "authenticates", force: :cascade do |t|
    t.string   "uid",        limit: 255
    t.string   "provider",   limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categorables", force: :cascade do |t|
    t.integer  "categorable_id",   limit: 4
    t.string   "categorable_type", limit: 255
    t.integer  "user_id",          limit: 4
    t.integer  "category_id",      limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "user_id",    limit: 4
    t.string   "image",      limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "post_id",          limit: 4
    t.string   "title",            limit: 255
    t.text     "body",             limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "commentable_id",   limit: 4
    t.string   "commentable_type", limit: 255
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer  "education_history_id", limit: 4
    t.string   "name",                 limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "dislikes", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "dislikable_id",   limit: 4
    t.string   "dislikable_type", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "education_histories", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "specialization_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "course_id",         limit: 4
    t.integer  "institute_id",      limit: 4
    t.date     "start_year"
    t.date     "end_year"
  end

  create_table "employment_details", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.float    "total_experience", limit: 24
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "designation",      limit: 255
    t.string   "organization",     limit: 255
    t.string   "start_work_date",  limit: 255
    t.string   "worked_till",      limit: 255
    t.text     "description",      limit: 65535
  end

  create_table "followings", force: :cascade do |t|
    t.integer  "follower_id",     limit: 4
    t.integer  "following_id",    limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "followable_id",   limit: 4
    t.string   "followable_type", limit: 255
  end

  create_table "forum_polls", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.string   "topic",       limit: 255
    t.text     "body",        limit: 65535
    t.string   "visibility",  limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "topic_id",    limit: 4
    t.string   "attachement", limit: 255
    t.integer  "user_id",     limit: 4
  end

  create_table "forums", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "description", limit: 255
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",   limit: 4,   null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "institutes", force: :cascade do |t|
    t.integer  "education_history_id", limit: 4
    t.string   "name",                 limit: 255
    t.date     "passing_year"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "likable_id",   limit: 4
    t.string   "likable_type", limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.boolean  "vote"
  end

  create_table "messages", force: :cascade do |t|
    t.text     "body",            limit: 65535
    t.integer  "conversation_id", limit: 4
    t.integer  "user_id",         limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "notifictaion_type",   limit: 255
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "notification_status", limit: 255
  end

  create_table "organisations", force: :cascade do |t|
    t.integer  "employment_detail_id", limit: 4
    t.string   "designation",          limit: 255
    t.date     "start_date"
    t.date     "end_date"
    t.boolean  "current_company"
    t.string   "job_profile",          limit: 255
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.string   "name",                 limit: 255
  end

  create_table "paypal_details", force: :cascade do |t|
    t.string   "express_token",    limit: 255
    t.string   "express_payer_id", limit: 255
    t.string   "name",             limit: 255
    t.string   "address",          limit: 255
    t.string   "city",             limit: 255
    t.string   "country",          limit: 255
    t.string   "zip",              limit: 255
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",         limit: 4
    t.integer  "category_id",     limit: 4
    t.text     "title",           limit: 65535
    t.text     "description",     limit: 65535
    t.string   "file",            limit: 255
    t.boolean  "visibility",                    default: true
    t.datetime "expiration_date"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.integer  "topic_id",        limit: 4
    t.string   "image",           limit: 255
    t.string   "video",           limit: 255
    t.string   "site_link",       limit: 255
    t.string   "topic",           limit: 255
    t.date     "start_date"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name",        limit: 255
    t.string   "last_name",         limit: 255
    t.integer  "user_id",           limit: 4
    t.string   "gender",            limit: 255
    t.string   "image",             limit: 255
    t.string   "phone_no",          limit: 255
    t.string   "location",          limit: 255
    t.date     "dob"
    t.string   "screen_name",       limit: 255
    t.integer  "specialization_id", limit: 4
    t.string   "street",            limit: 255
    t.string   "post_code",         limit: 255
    t.string   "city",              limit: 255
    t.string   "country",           limit: 255
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "profile_type",      limit: 255
    t.string   "ethnic_group",      limit: 255
    t.string   "state",             limit: 255
  end

  create_table "replies", force: :cascade do |t|
    t.integer  "comment_id", limit: 4
    t.text     "body",       limit: 65535
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "reveal_identities", force: :cascade do |t|
    t.integer  "sender_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "body",       limit: 65535
    t.boolean  "accept"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "user_skill_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "user_id",       limit: 4
  end

  create_table "specializations", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "static_pages", force: :cascade do |t|
    t.text     "help_center",          limit: 65535
    t.text     "terms_and_conditions", limit: 65535
    t.text     "privacy_policy",       limit: 65535
    t.text     "how_it_work",          limit: 65535
    t.string   "facebook_link",        limit: 255
    t.string   "twitter_link",         limit: 255
    t.string   "google_link",          limit: 255
    t.text     "about_us",             limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.text     "contactus",            limit: 65535
  end

  create_table "subscriptions", force: :cascade do |t|
    t.boolean  "subscribe"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "forum_id",    limit: 4
    t.integer  "user_id",     limit: 4
    t.text     "description", limit: 65535
    t.string   "name",        limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "file",        limit: 255
    t.integer  "category_id", limit: 4
    t.string   "slug",        limit: 255
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "specialization_id",      limit: 255
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "name",                   limit: 255
    t.string   "screen_name",            limit: 255
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_categories", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "category_ids", limit: 255
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "forum_poll_id", limit: 4
    t.integer  "votable_id",    limit: 4
    t.string   "votable_type",  limit: 255
    t.string   "vote_type",     limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
end
