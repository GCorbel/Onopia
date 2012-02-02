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

ActiveRecord::Schema.define(:version => 20120131193640) do

  create_table "account_types", :force => true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "accounts", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.decimal  "balance",         :precision => 2, :scale => 0
    t.integer  "user_id"
    t.integer  "bank_id"
    t.integer  "account_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "alerts", :force => true do |t|
    t.string   "label"
    t.string   "type"
    t.string   "priority"
    t.string   "frequency"
    t.string   "operation"
    t.decimal  "amount",     :precision => 2, :scale => 0
    t.integer  "category"
    t.boolean  "send"
    t.integer  "user_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "balances", :force => true do |t|
    t.decimal  "real",       :precision => 2, :scale => 0
    t.decimal  "virtual",    :precision => 2, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "banks", :force => true do |t|
    t.string   "label"
    t.string   "url"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "budgets", :force => true do |t|
    t.string   "period"
    t.decimal  "amount",      :precision => 2, :scale => 0
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "folders", :force => true do |t|
    t.string   "label"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "messages", :force => true do |t|
    t.string   "subject"
    t.integer  "user_id"
    t.integer  "bank_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "news", :force => true do |t|
    t.string   "url"
    t.string   "title"
    t.string   "favicon"
    t.integer  "folder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "opportunities", :force => true do |t|
    t.string   "from"
    t.string   "subject"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_types", :force => true do |t|
    t.string   "label"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "records", :force => true do |t|
    t.string   "label"
    t.decimal  "amount",      :precision => 2, :scale => 0
    t.boolean  "credit"
    t.boolean  "splitted"
    t.string   "code"
    t.decimal  "balance",     :precision => 2, :scale => 0
    t.boolean  "virtual"
    t.integer  "record_id"
    t.integer  "user_id"
    t.integer  "category_id"
    t.integer  "account_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "simple_captcha_data", :force => true do |t|
    t.string   "key",        :limit => 40
    t.string   "value",      :limit => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], :name => "idx_key"

  create_table "themes", :force => true do |t|
    t.string   "label"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                             :null => false
    t.string   "email",                                :null => false
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.boolean  "active",            :default => false, :null => false
    t.string   "perishable_token",  :default => "",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "theme_id"
  end

end
