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

ActiveRecord::Schema.define(:version => 20131224075713) do

  create_table "user_word_sets", :force => true do |t|
    t.integer  "user_id",                                   :null => false
    t.integer  "word_set_id",                               :null => false
    t.string   "permissions", :limit => 1, :default => "r", :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "user_word_sets", ["user_id"], :name => "user_word_sets_user_id_fk"
  add_index "user_word_sets", ["word_set_id"], :name => "user_word_sets_word_set_id_fk"

  create_table "users", :force => true do |t|
    t.string   "first_name",             :default => "",    :null => false
    t.string   "last_name",              :default => "",    :null => false
    t.boolean  "admin",                  :default => false, :null => false
    t.integer  "learnt_threshold",       :default => 20,    :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0,     :null => false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "uid"
    t.string   "provider"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "word_sets", :force => true do |t|
    t.string "name", :null => false
  end

  add_foreign_key "user_word_sets", "users", name: "user_word_sets_user_id_fk", dependent: :delete
  add_foreign_key "user_word_sets", "word_sets", name: "user_word_sets_word_set_id_fk", dependent: :delete

end
