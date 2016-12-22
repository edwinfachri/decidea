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

ActiveRecord::Schema.define(version: 20161222041752) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "message"
    t.boolean  "replied",    default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "job_post_comments", force: :cascade do |t|
    t.integer  "job_post_id"
    t.integer  "user_id"
    t.string   "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["job_post_id"], name: "index_job_post_comments_on_job_post_id"
    t.index ["user_id"], name: "index_job_post_comments_on_user_id"
  end

  create_table "job_post_users", force: :cascade do |t|
    t.integer  "job_post_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["job_post_id", "user_id"], name: "index_job_post_users_on_job_post_id_and_user_id", unique: true
    t.index ["job_post_id"], name: "index_job_post_users_on_job_post_id"
    t.index ["user_id"], name: "index_job_post_users_on_user_id"
  end

  create_table "job_post_views", force: :cascade do |t|
    t.integer  "job_post_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["job_post_id", "user_id"], name: "index_job_post_views_on_job_post_id_and_user_id", unique: true
    t.index ["job_post_id"], name: "index_job_post_views_on_job_post_id"
    t.index ["user_id"], name: "index_job_post_views_on_user_id"
  end

  create_table "job_posts", force: :cascade do |t|
    t.string   "job_title"
    t.text     "job_description"
    t.integer  "speciality_id"
    t.string   "company_name"
    t.text     "company_description"
    t.string   "company_website"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "logo"
    t.integer  "rates"
    t.integer  "user_id"
    t.integer  "location_id"
    t.index ["user_id"], name: "index_job_posts_on_user_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "message_users", force: :cascade do |t|
    t.integer  "sender_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "messages", force: :cascade do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "message_user_id"
    t.integer  "user_id"
    t.boolean  "read",            default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["message_user_id"], name: "index_messages_on_message_user_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "notified_by_id"
    t.integer  "identifier"
    t.integer  "notice_type"
    t.boolean  "read",           default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["notified_by_id"], name: "index_notifications_on_notified_by_id"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "portfolio_id"
    t.string   "picture"
    t.index ["portfolio_id"], name: "index_pictures_on_portfolio_id"
  end

  create_table "portfolio_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "portfolio_id"
    t.string   "comment"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["portfolio_id"], name: "index_portfolio_comments_on_portfolio_id"
    t.index ["user_id"], name: "index_portfolio_comments_on_user_id"
  end

  create_table "portfolio_view_likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "portfolio_id"
    t.boolean  "like",         default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["portfolio_id", "user_id"], name: "index_portfolio_view_likes_on_portfolio_id_and_user_id", unique: true
    t.index ["portfolio_id"], name: "index_portfolio_view_likes_on_portfolio_id"
    t.index ["user_id"], name: "index_portfolio_view_likes_on_user_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
    t.integer  "speciality_id"
    t.index ["speciality_id"], name: "index_portfolios_on_speciality_id"
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "profile_pictures", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "picture"
    t.boolean  "activated",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["user_id"], name: "index_profile_pictures_on_user_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["followed_id"], name: "index_relationships_on_followed_id"
    t.index ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
    t.index ["follower_id"], name: "index_relationships_on_follower_id"
  end

  create_table "specialities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.index ["category_id"], name: "index_specialities_on_category_id"
  end

  create_table "specialities_users", id: false, force: :cascade do |t|
    t.integer "user_id",       null: false
    t.integer "speciality_id", null: false
    t.index ["speciality_id"], name: "index_specialities_users_on_speciality_id"
    t.index ["user_id", "speciality_id"], name: "index_specialities_users_on_user_id_and_speciality_id", unique: true
    t.index ["user_id"], name: "index_specialities_users_on_user_id"
  end

  create_table "speciality_job_posts", force: :cascade do |t|
    t.integer  "job_post_id"
    t.integer  "speciality_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["job_post_id", "speciality_id"], name: "index_speciality_job_posts_on_job_post_id_and_speciality_id", unique: true
    t.index ["job_post_id"], name: "index_speciality_job_posts_on_job_post_id"
    t.index ["speciality_id"], name: "index_speciality_job_posts_on_speciality_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.string   "username"
    t.string   "last_name"
    t.string   "location"
    t.text     "biography"
    t.boolean  "paid",              default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
