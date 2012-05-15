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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120514233100) do

  create_table "messages", :force => true do |t|
    t.string   "topic"
    t.text     "body"
    t.integer  "received_messageable_id"
    t.string   "received_messageable_type"
    t.integer  "sent_messageable_id"
    t.string   "sent_messageable_type"
    t.boolean  "opened",                     :default => false
    t.boolean  "recipient_delete",           :default => false
    t.boolean  "sender_delete",              :default => false
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.string   "ancestry"
    t.boolean  "recipient_permanent_delete", :default => false
    t.boolean  "sender_permanent_delete",    :default => false
  end

  add_index "messages", ["ancestry"], :name => "index_messages_on_ancestry"
  add_index "messages", ["sent_messageable_id", "received_messageable_id"], :name => "acts_as_messageable_ids"

  create_table "personal_skills", :force => true do |t|
    t.integer  "skill_id"
    t.integer  "user_id"
    t.integer  "expertise_level"
    t.integer  "years_of_experience"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "personal_styles", :force => true do |t|
    t.integer  "style_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "reviews", :force => true do |t|
    t.text     "detail"
    t.integer  "rating"
    t.integer  "posted_by"
    t.integer  "space_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "spaces", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.decimal  "hourly_pricing"
    t.text     "description"
    t.string   "availability"
    t.string   "equipment"
    t.string   "capacity"
    t.string   "size"
    t.string   "rooms"
    t.text     "about"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                        :default => "", :null => false
    t.string   "encrypted_password",           :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "name"
    t.string   "location"
    t.string   "profile_picture_file_name"
    t.string   "profile_picture_content_type"
    t.integer  "profile_picture_file_size"
    t.datetime "profile_picture_updated_at"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "hide_location_from_search"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "welcomes", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
